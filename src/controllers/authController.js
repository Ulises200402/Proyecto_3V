import { pool } from "../db.js";
import { isAuthenticated } from '../router/Middleware/authMiddleware.js'; // Importa el middleware

export const authLogin = async (req, res) => {
    const { Gmail, username, password } = req.body;
    console.log(Gmail, username, password); // Para depuración

    try {
        const [users] = await pool.query(
            'SELECT * FROM user WHERE Gmail = ? AND username = ? AND password = ?',
            [Gmail, username, password]
        );

        if (users.length > 0) {
            req.session.user = users[0];
            return res.redirect("/customers");
        } else {
            req.session.message = "Credenciales inválidas";
            return res.redirect("/login");
        }
    } catch (error) {
        console.error('Error durante el login:', error);
        req.session.message = "Error en el servidor";
        return res.redirect("/login");
    }
};

export const registerUser = async (req, res) => {
    console.log('El register funciona');
    const { Gmail, username, password, confirmPassword } = req.body;

    // Validar si las contraseñas coinciden
    if (password !== confirmPassword) {
        req.session.message = "Las contraseñas no coinciden."; // Establece el mensaje de error en la sesión
        return res.redirect('/register'); // Redirige al formulario de registro
    }

    try {
        // Verificar si el Gmail ya existe
        const [existingGmail] = await pool.query('SELECT * FROM user WHERE Gmail = ?', [Gmail]);
        if (existingGmail.length > 0) {
            req.session.message = "Ese Gmail ya está en uso."; // Mensaje de error si el Gmail ya existe
            return res.redirect('/register'); // Redirige al formulario de registro
        }

        // Verificar si el nombre de usuario ya existe
        const [existingUser] = await pool.query('SELECT * FROM user WHERE username = ?', [username]);
        if (existingUser.length > 0) {
            req.session.message = "El nombre de usuario ya existe."; // Mensaje de error si el nombre de usuario ya existe
            return res.redirect('/register'); // Redirige al formulario de registro
        }

        // Guardar el usuario en la base de datos
        await pool.query('INSERT INTO user (Gmail, username, password) VALUES (?, ?, ?)', [Gmail, username, password]);

        // Responder con éxito
        return res.redirect('/customers');
    } catch (error) {
        console.error(error);
        req.session.message = "Error al registrar el usuario."; // Mensaje de error genérico
        return res.redirect('/register'); // Redirige al formulario de registro
    }
};