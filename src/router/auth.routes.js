import { Router } from "express";
import { authLogin } from "../controllers/authController.js";
import { registerUser, logout} from '../controllers/authController.js';
// routes.js o tu archivo de rutas

const router = Router();

router.get('/index', (req, res) => {
    res.render('index', { user: req.session.user || null });
    console.log(req.session.user)
});

router.get('/contacto', (req, res) => {
    res.render('contacto'); 
});

router.get('/Informacion', (req, res) => {
    res.render('Informacion'); 
});

router.get('/login', (req, res) => {
    const message = req.session.message; // Toma el mensaje de la sesión
    req.session.message = null; // Limpia el mensaje de la sesión
    res.render('login', { message }); // Renderiza la vista y pasa el mensaje
});

// Ruta POST para el proceso de inicio de sesión
router.post('/login', authLogin);

// Ruta GET para la página de registro
router.get('/register', (req, res) => {
    const message = req.session.message; // Toma el mensaje de la sesión, si existe
    req.session.message = null; // Limpia el mensaje después de mostrarlo
    res.render('register', { message }); // Renderiza la vista y pasa el mensaje
});

// Ruta POST para el proceso de registro
router.post('/register', registerUser);

router.get('/logout', logout);

export default router