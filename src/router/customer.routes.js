import { Router } from "express";
import { renderCustomers, createCustomers, deleteCustomer, editCustomer, updateCustomer, misreservas} from "../controllers/customerController.js";
import { obtenerPrecio } from "../controllers/priceController.js";
import { isAuthenticated } from './Middleware/authMiddleware.js';
const router = Router();


//CRUD
router.get("/customers",isAuthenticated, renderCustomers);
router.post("/add", createCustomers);
// Ruta para eliminar una reserva
router.post("/delete/:id", deleteCustomer);
// Ruta para editar una reserva
router.get("/edit/:id", editCustomer);
router.post("/update/:id", updateCustomer);
router.get('/misreservas',isAuthenticated, misreservas);

export default router