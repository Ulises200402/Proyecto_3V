import { Router } from "express";
import { renderCustomers, createCustomers, deleteCustomer, editCustomer, updateCustomer} from "../controllers/customerController.js";
import { authLogin } from "../controllers/authController.js";
import { isAuthenticated } from './Middleware/authMiddleware.js';
const router = Router();


//CRUD
router.get("/customers",isAuthenticated, renderCustomers);
router.post("/add", createCustomers);
router.get("/delete/:id", deleteCustomer);
router.get("/update/:id", editCustomer);
router.post("/update/:id", updateCustomer);


export default router