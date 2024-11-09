import { pool } from "../db.js";

export const renderCustomers = async(req, res) => {
   const userId = req.session.userId; // Obtén el idUser de la sesión
   const [row] =  await pool.query("SELECT * FROM reservas");
   const [lugares] = await pool.query('SELECT * FROM lugares'); // Obtener los lugares

   try {
      // Filtra las reservas por el idUser del usuario actual
      const [customers] = await pool.query('SELECT * FROM reservas WHERE idUser = ?', [userId]);
      res.render('customers', { lugares,customers: row});
  } catch (error) {
      console.error('Error al obtener las reservas:', error);
      res.status(500).send('Error al cargar las reservas');
  }
}

export const misreservas = async (req, res) => {
    // Asegúrate de acceder al iduser dentro del objeto user
    const idUser = req.session.user?.iduser; // Usa el operador de encadenamiento opcional (?.) para mayor seguridad
    console.log("ID del usuario en la sesión:", idUser);

    if (!idUser) {
        return res.status(401).send("Usuario no autenticado");
    }

    try {
        const [reservas] = await pool.query('SELECT * FROM reservas WHERE idUser = ?', [idUser]);
        res.render('misreservas', { reservas });
    } catch (error) {
        console.error('Error al obtener las reservas:', error);
        res.status(500).send('Error al cargar las reservas');
    }
};

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
   res.redirect('/customers'); // Cambia esto según tu flujo
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
           res.json({ message: "Reserva eliminada" });
       } else {
           res.status(404).json({ message: "Reserva no encontrada" });
       }
   } catch (error) {
       console.error('Error al eliminar la reserva:', error);
       res.status(500).json({ message: "Error al eliminar la reserva" });
   }
}

export const editCustomer = async (req, res) => {
   console.log('Este metodo es para editar')
   const { id } = req.params;
   try {
       const [result] = await pool.query('SELECT * FROM reservas WHERE idReservas = ?', [id]);
       const [lugaresResult] = await pool.query("SELECT idLugar, lugarDestino FROM lugares"); // Consulta para obtener los lugares
       if (result.length > 0) {
           res.render('customers_edit', { customer: result[0], lugares: lugaresResult });
       } else {
           res.status(404).send('Reserva no encontrada');
       }
   } catch (error) {
       console.error('Error al obtener la reserva para editar:', error);
       res.status(500).send('Error al obtener la reserva para editar');
   }
}

export const updateCustomer = async (req, res) => {
   const { nombre, idDestino, fecha_ida, fecha_vuelta } = req.body;
   const idReservas = req.params.id; // Asegúrate de que este valor se esté pasando correctamente
   console.log(req.body);
   // Verificar que las fechas no estén vacías
   if (!fecha_ida || !fecha_vuelta) {
     return res.status(400).send("Las fechas son requeridas");
   }
 
   // Crear la consulta para actualizar la reserva
   try {
     const [result] = await pool.query(
       "UPDATE reservas SET nombre = ?, idDestino = ?, `Fecha de Ida` = ?, `Fecha de Vuelta` = ? WHERE idReservas = ?",
       [nombre, idDestino, fecha_ida, fecha_vuelta, idReservas]
     );
 
     if (result.affectedRows === 0) {
       return res.status(404).send("Reserva no encontrada");
     }
 
     res.redirect("/customers"); // Redirigir a la página de customers
   } catch (error) {
     console.error("Error al actualizar la reserva:", error);
     res.status(500).send("Error al actualizar la reserva");
   }
 };