// priceController.js
import { pool } from '../db.js';

// Función para calcular el precio de un viaje
const calcularPrecioPasaje = (distancia) => {
    if (isNaN(distancia) || distancia <= 0) {
        console.error("La distancia no es válida", distancia);
        return null;
    }

    const precioCombustiblePorLitro = 320;
    const consumoPor100Km = 35;
    const sueldoChofer = 750000;
    const cantidadAsientos = 50;
    const margenBeneficio = 2.0;

    const litrosNecesarios = (distancia / 100) * consumoPor100Km;
    const costoCombustible = litrosNecesarios * precioCombustiblePorLitro;
    const costoTotalViaje = costoCombustible + sueldoChofer;
    const ingresoTotalNecesario = costoTotalViaje * (1 + margenBeneficio);
    const precioPorPasajero = ingresoTotalNecesario / cantidadAsientos;

    return precioPorPasajero.toFixed(2);
};

// Función para obtener el precio por destino
export const obtenerPrecio = async (destinoId) => {
    try {
        const [rows] = await pool.query('SELECT Distancia FROM lugares WHERE idLugar = ?', [destinoId]);

        if (rows.length === 0) {
            console.error(`Destino no encontrado para el idDestino: ${destinoId}`);
            throw new Error('Destino no encontrado');
        }

        const distancia = rows[0].Distancia;  // Asegúrate de usar la propiedad correcta
        if (isNaN(distancia) || distancia <= 0) {
        return res.status(400).json({ error: 'Distancia inválida para el destino' });
        }
        const precio = calcularPrecioPasaje(distancia);

        return { precio };  // Devuelve el precio para usarlo en el controlador
    } catch (error) {
        console.error('Error al calcular el precio:', error);
        throw error;  // Re-lanzar el error para manejarlo en el controlador
    }
};