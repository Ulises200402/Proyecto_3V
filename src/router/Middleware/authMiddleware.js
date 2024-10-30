export const isAuthenticated = (req, res, next) => {
    if (req.session.user) {
        return next(); // El usuario está autenticado, permite el acceso
    }
    res.redirect('/login'); // Redirige a la página de inicio de sesión si no está autenticado
};