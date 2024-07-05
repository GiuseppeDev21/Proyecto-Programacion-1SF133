document.addEventListener("DOMContentLoaded", function() {
    // Selecciona el botón de inicio de sesión por su ID
    const botonIniciar = document.getElementById("btnIniciar");

    // Añade un evento de clic al botón
    botonIniciar.addEventListener("click", function(event) {
        event.preventDefault(); // Evita enviar el formulario por defecto

        // Obtiene el valor de los campos de usuario y contraseña
        const usuario = document.querySelector("input[type='text']").value;
        const contrasena = document.querySelector("input[type='password']").value;

        // Verifica las credenciales
        if (usuario === "123" && contrasena === "123") {
            // Redirecciona a la página de administración
            window.location.href = "homepageAdministracion.html";
        } else {
            // Muestra un mensaje de error
            alert("Usuario o contraseña incorrectos. Por favor, inténtalo de nuevo.");
        }
    });
});
