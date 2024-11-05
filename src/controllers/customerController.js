import { pool } from "../db.js";

export const renderCustomers = async(req, res) => {
   const userId = req.session.userId; // Obtén el idUser de la sesión
   const [row] =  await pool.query("SELECT * FROM reservas");
   const [lugares] = await pool.query('SELECT * FROM lugares'); // Obtener los lugares

   try {
      // Filtra las reservas por el idUser del usuario actual
      const [customers] = await pool.query('SELECT * FROM Reservas WHERE idUser = ?', [userId]);
      res.render('customers', { lugares,customers: row});
  } catch (error) {
      console.error('Error al obtener las reservas:', error);
      res.status(500).send('Error al cargar las reservas');
  }
}

export const misreservas = async(req, res) => {
   const idUser = req.session.userId; // Asegúrate de que el id del usuario esté en la sesión

   try {
       const [reservas] = await pool.query('SELECT * FROM Reservas WHERE idUser = ?', [idUser]);
       res.render('misreservas', { reservas });
   } catch (error) {
       console.error('Error al obtener las reservas:', error);
       res.status(500).send('Error al cargar las reservas');
   }
}

export const createCustomers = async (req, res) => {
   const { nombre, lugar, fechaida, fechavuelta } = req.body;
   const iduser = req.session.userid;
   if (!iduser) {
      return res.status(401).send('Usuario no autenticado');
  }
  try {
   // Obtener el id del viaje asignado a este lugar
   const [viajes] = await pool.query('SELECT idViaje FROM viaje WHERE idDestino = ?', [lugar]);
   console.log(viajes);
   
   if (viajes.length === 0) {
       return res.status(400).send('No hay viajes disponibles para este destino.');
   }
   
   const idDestino = lugar;
   const idViaje = viajes[0].idViaje;

   const query = 'INSERT INTO Reservas (nombre, idDestino, Fecha de Ida, Fecha de Vuelta, iduser, idViaje) VALUES (?, ?, ?, ?, ?, ?)';
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
   const result = await pool.query("DELETE FROM reservas WHERE idReservas = ? ", [id])
   if(result.affectedRows === 1){
      res.json({ message: "Customer Eliminado"})
   }
   res.redirect("/customer")
}

export const editCustomer = async (req, res) => {
   console.log('Este metodo es para editar')
   const { id } = req.params;
   const [result] = await pool.query("SELECT * FROM reservas WHERE idReservas = ?", [id,] );
   res.render("customers_edit", { customer: result[0]})
}

export const updateCustomer = async (req, res) => {
   const {id} = req.params;
   const updateCustomer =  req.body;
   await pool.query("UPDATE reservas set ? WHERE idReservas = ? ", [updateCustomer, id]);
   res.redirect("/customer")
};