import { Router } from "express";
import { renderCustomers, createCustomers, deleteCustomer, editCustomer, updateCustomer, misreservas} from "../controllers/customerController.js";
import { obtenerPrecio } from "../controllers/priceController.js";
import { isAuthenticated } from './Middleware/authMiddleware.js';
const router = Router();


//CRUD
router.get("/customers",isAuthenticated, renderCustomers);
router.post("/add", createCustomers);
router.get("/delete/:id", deleteCustomer);
router.get("/update/:id", editCustomer);
router.post("/update/:id", updateCustomer);
router.post("/misreservas", misreservas );
router.get('/precio/:destinoId', obtenerPrecio);

export default router