// controllers/priceController.js
import { pool } from '../db.js';

// Datos base
const precioCombustiblePorLitro = 320;
const consumoPor100Km = 35;
const sueldoChofer = 750000;
const cantidadAsientos = 50;
const margenBeneficio = 2.0;

// Función para calcular el precio de un viaje
const calcularPrecioPasaje = (distancia) => {
    const litrosNecesarios = (distancia / 100) * consumoPor100Km;
    const costoCombustible = litrosNecesarios * precioCombustiblePorLitro;
    const costoTotalViaje = costoCombustible + sueldoChofer;
    const ingresoTotalNecesario = costoTotalViaje * (1 + margenBeneficio);
    const precioPorPasajero = ingresoTotalNecesario / cantidadAsientos;

    return precioPorPasajero.toFixed(2);
};

// Controlador para obtener y calcular el precio según el destino seleccionado
export const obtenerPrecio = async (req, res) => {
    const { destinoId } = req.params;

    try {
        // Obtener la distancia del destino desde la base de datos
        const [rows] = await pool.query('SELECT Distancia FROM lugares WHERE idLugar = ?', [destinoId]);
        
        if (rows.length === 0) {
            return res.status(404).json({ error: 'Destino no encontrado' });
        }

        const distancia = rows[0].distancia;
        const precio = calcularPrecioPasaje(distancia);

        // Enviar el precio calculado como respuesta
        res.json({ destinoId, precio });
    } catch (error) {
        console.error('Error al calcular el precio:', error);
        res.status(500).json({ error: 'Error al calcular el precio' });
    }
};