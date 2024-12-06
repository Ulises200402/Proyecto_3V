import PDFDocument from 'pdfkit';
import fs from 'fs';
import moment from 'moment';
import path from 'path';
import { obtenerPrecio } from './priceController.js';
import { pool } from "../db.js";

export const renderCustomers = async (req, res) => {
    const userId = req.session.userId; // Obtén el idUser de la sesión
    const [row] = await pool.query("SELECT * FROM reservas");
    const [lugares] = await pool.query('SELECT * FROM lugares'); // Obtener los lugares

    try {
        // Filtra las reservas por el idUser del usuario actual
        const [customers] = await pool.query('SELECT * FROM reservas WHERE idUser = ?', [userId]);
        res.render('customers', { lugares, customers: row });
    } catch (error) {
        console.error('Error al obtener las reservas:', error);
        res.status(500).send('Error al cargar las reservas');
    }
}

export const misreservas = async (req, res) => {
    try {
        const userId = req.session.user.iduser;  // Asegurate de que el ID del usuario esté en la sesión

        // Obtener las reservas del usuario autenticado, uniendo las tablas 'reservas' y 'lugares' para obtener los destinos
        const [reservas] = await pool.query(`
            SELECT r.idReservas, r.nombre, l.lugarDestino AS destino, r.\`Fecha de Ida\`, r.\`Fecha de Vuelta\`, r.idDestino
            FROM reservas r
            JOIN lugares l ON r.idDestino = l.idLugar
            WHERE r.iduser = ?`, [userId]);

        // Para cada reserva, obtenemos el precio
        for (let reserva of reservas) {
            
            const precio = await obtenerPrecio(reserva.idDestino);
            reserva.precio = precio.precio;
        
            const [destino] = await pool.query('SELECT lugarDestino FROM lugares WHERE idLugar = ?', [reserva.idDestino]);
            reserva.destino = destino[0]?.lugarDestino || 'Destino desconocido';
        }
        // Formatear las fechas a un formato legible (ejemplo: 'DD/MM/YYYY')
        reservas.forEach(reserva => {
            reserva['Fecha de Ida'] = formatDate(reserva['Fecha de Ida']);
            reserva['Fecha de Vuelta'] = formatDate(reserva['Fecha de Vuelta']);
        });

        // Pasar las reservas a la vista 'misreservas.ejs'
        res.render('misreservas', { reservas });
    } catch (error) {
        console.error('Error al obtener las reservas:', error);
        res.status(500).send('Error al obtener las reservas');
    }
};

// Función para formatear las fechas
function formatDate(date) {
    const d = new Date(date);
    const day = String(d.getDate()).padStart(2, '0');
    const month = String(d.getMonth() + 1).padStart(2, '0'); // Los meses van de 0 a 11
    const year = d.getFullYear();
    return `${day}/${month}/${year}`;
}

export const createCustomers = async (req, res) => {
    const { nombre, lugar, fechaida, fechavuelta } = req.body;
    console.log(req.body)
    const iduser = req.session.userid;
    if (!iduser) {
        return res.status(401).send('Usuario no autenticado');
    }
    if (!fechaida || !fechavuelta) {
        return res.status(400).send('Las fechas de ida y vuelta son obligatorias.');
    }
    try {
        // Obtener el id del viaje asignado a este lugar
        const [viajes] = await pool.query('SELECT idViaje FROM viaje WHERE idDestino = ?', [lugar]);

        if (viajes.length === 0) {
            return res.status(400).send('No hay viajes disponibles para este destino.');
        }

        const idDestino = lugar;
        const idViaje = viajes[0].idViaje;

        const query = 'INSERT INTO Reservas (nombre, idDestino, `Fecha de Ida`, `Fecha de Vuelta`, iduser, idViaje) VALUES (?, ?, ?, ?, ?, ?)';
        await pool.query(query, [nombre, idDestino, fechaida, fechavuelta, iduser, idViaje]);
        // Redirigir a la página de clientes o mostrar un mensaje de éxito
        res.redirect('/misreservas'); // Cambia esto según tu flujo
    } catch (error) {
        console.error('Error al crear la reserva:', error);
        res.status(500).send('Error al crear la reserva');
    }
};

export const deleteCustomer = async (req, res) => {
    console.log('Se eliminar!!!')
    const { id } = req.params;
    console.log(id)
    try {
        const [result] = await pool.query('DELETE FROM reservas WHERE idReservas = ? ', [id]);
        if (result.affectedRows === 1) {
            res.redirect('/misreservas');
        } else {
            res.status(404).json({ message: "Reserva no encontrada" });
        }
    } catch (error) {
        console.error('Error al eliminar la reserva:', error);
        res.status(500).json({ message: "Error al eliminar la reserva" });
    }
}

export const editCustomer = async (req, res) => {
    console.log('Este método es para editar');
    const { id } = req.params;
    try {
        // Obtener los detalles de la reserva
        const [result] = await pool.query('SELECT * FROM reservas WHERE idReservas = ?', [id]);
        console.log(result)
        const [lugaresResult] = await pool.query('SELECT idLugar, lugarDestino FROM lugares'); // Obtener lugares

        if (result.length > 0) {
            // Renderizar la vista de edición con los datos actuales y los lugares disponibles
            res.render('customers_edit', { customer: result[0], lugares: lugaresResult });
        } else {
            res.status(404).send('Reserva no encontrada');
        }
    } catch (error) {
        console.error('Error al obtener la reserva para editar:', error);
        res.status(500).send('Error al obtener la reserva para editar');
    }
};

// Controlador para actualizar la reserva (después de que el usuario edite)
export const updateCustomer = async (req, res) => {
    const { id } = req.params;
    const { idDestino, fechaIda, fechaVuelta } = req.body;

    try {

        const fechaIda = req.body.fechaIda;  // Asumiendo que la fecha se recibe desde el formulario
        const fechaVuelta = req.body.fechaVuelta;

        if (isNaN(new Date(fechaIda)) || isNaN(new Date(fechaVuelta))) {
            return res.status(400).send('Las fechas proporcionadas no son válidas');
        }

        // Usamos el idDestino para actualizar el idViaje
        const [result] = await pool.query(
            'UPDATE reservas SET idDestino = ?, idViaje = ?, `Fecha de Ida` = ?, `Fecha de Vuelta` = ? WHERE idReservas = ?',
            [idDestino, idDestino, fechaIda, fechaVuelta, id]
        );
        console.log(result)

        // Verificar si se actualizó correctamente
        if (result.affectedRows > 0) {
            res.redirect('/misreservas'); // Redirigir a la página de mis reservas
        } else {
            res.status(404).send('No se encontró la reserva para actualizar');
        }
    } catch (error) {
        console.error('Error al actualizar la reserva:', error);
        res.status(500).send('Error al actualizar la reserva');
    }
};

export const generarTicket = async (req, res) => {
    const { idReservas } = req.params;

    try {
        // Consulta para obtener los datos de la reserva
        const [result] = await pool.query(
            `SELECT 
                r.nombre AS nombreReserva, 
                r.\`Fecha de Ida\`, 
                r.\`Fecha de Vuelta\`, 
                v.idMicros, 
                v.idChoferes,
                m.Modelo AS nombreMicro,
                m.Marca AS marcaMicro,
                m.Patente AS patenteMicro,
                c.Nombre AS nombreChofer,
                c.Apellido AS apellidoChofer,
                r.idDestino  
            FROM reservas r
            JOIN viaje v ON r.idViaje = v.idViaje
            JOIN micros m ON v.idMicros = m.idMicros
            JOIN choferes c ON v.idChoferes = c.idChoferes
            WHERE r.idReservas = ?`,
            [idReservas]
        );

        if (result.length === 0) {
            return res.status(404).send('Reserva no encontrada');
        }

        const reserva = result[0];
        const destinoId = reserva.idDestino;
        console.log('idDestino de la reserva:', destinoId);

        // Obtener el precio
        const precioData = await obtenerPrecio(destinoId);
        if (!precioData) {
            return res.status(500).json({ error: 'No se pudo calcular el precio' });
        }
        const precio = precioData.precio;

        // Extraer los datos de la reserva
        const { nombreReserva, 'Fecha de Ida': fechaIda, 'Fecha de Vuelta': fechaVuelta, nombreMicro, nombreChofer, apellidoChofer, marcaMicro, patenteMicro } = reserva;
        const fechaIdaFormateada = moment(fechaIda).format('DD/MM/YYYY');
        const fechaVueltaFormateada = moment(fechaVuelta).format('DD/MM/YYYY');

        // Crear PDF
        const doc = new PDFDocument({ size: [595.28, 310] });
        res.setHeader('Content-Disposition', `attachment; filename="boleto-${idReservas}.pdf"`);
        res.setHeader('Content-Type', 'application/pdf');
        doc.pipe(res);

        // Fondo y logo
        doc.rect(0, 0, doc.page.width, doc.page.height / 4).fill('#ADD8E6');
        const logoPath = path.resolve('src', 'public', 'styles', 'img', 'logo.png');
        if (fs.existsSync(logoPath)) {
            doc.image(logoPath, 20, 2, { width: 90 });
        }

        // Texto del boleto
        doc.font('Times-Roman').fillColor('black').fontSize(20).text('Boleto de Viaje', 250, 40);
        doc.font('Courier').fontSize(12)
            .text(`Nombre: ${nombreReserva}`, 50, 100)
            .text(`Fecha de Ida: ${fechaIdaFormateada}`, 50, 120)
            .text(`Fecha de Vuelta: ${fechaVueltaFormateada}`, 50, 140)
            .text(`Hora de Salida: 8:00 AM`, 50, 160)
            .text(`Micro: ${nombreMicro} ${marcaMicro}`, 50, 180)
            .text(`Patente: ${patenteMicro}`, 50, 200)
            .text(`Chofer: ${nombreChofer} ${apellidoChofer}`, 50, 220)
            .text(`Precio: $${precio}`, 400, 220);

        doc.end();
    } catch (error) {
        console.error('Error al generar el boleto en PDF:', error);
        res.status(500).send('Error al generar el boleto en PDF');
    }
};