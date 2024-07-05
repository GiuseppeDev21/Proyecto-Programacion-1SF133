<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.driver.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Gestión de Clientes</title>
    <link rel="stylesheet" href="../css/registroClientes.css">
</head>
<body>
    <header class="header">
        <div class="logo">
            <img src="../assets/isotipo.svg" alt="Logo de la empresa" width="300" height="150">
        </div>
        <div class="navbar_boton">
            <svg width="120" height="40" viewBox="0 0 120 40" fill="none" xmlns="http://www.w3.org/2000/svg" onclick="window.location.href='homepageAdministracion.html';">
                <rect width="120" height="40" rx="20" fill="#BE1C2D"/>
                <path d="M57.1348 28.7733V25.7156C57.1348 24.9351 57.7722 24.3023 58.5584 24.3023H61.4326C61.8102 24.3023 62.1723 24.4512 62.4393 24.7163C62.7063 24.9813 62.8563 25.3408 62.8563 25.7156V28.7733C62.8539 29.0978 62.9821 29.4099 63.2124 29.6402C63.4427 29.8705 63.7561 30 64.0829 30H66.0438C66.9596 30.0023 67.8388 29.6428 68.4872 29.0008C69.1356 28.3588 69.5 27.487 69.5 26.5778V17.8669C69.5 17.1325 69.1721 16.4358 68.6046 15.9647L61.934 10.6759C60.7737 9.74856 59.1111 9.7785 57.9854 10.747L51.467 15.9647C50.8727 16.422 50.5176 17.1206 50.5 17.8669V26.5689C50.5 28.4639 52.0474 30 53.9562 30H55.8723C56.5512 30 57.103 29.4562 57.1079 28.7822L57.1348 28.7733Z" fill="white"/>
            </svg>                
        </div>
        <nav class="nav-links">
            <a href="clientes.jsp">Clientes</a>
            <a href="facturas.jsp">Facturas</a>
            <a href="ordenes.jsp">Ordenes</a>
            <a href="productos.jsp">Productos</a>
            <a href="empleados.jsp">Empleados</a>
            <a href="proveedores.jsp">Proveedores</a>
        </nav>
    </header>
    <main >
        <div class="upper-side-container">
            <div class="upper-side-title">
                <svg width="91" height="140" viewBox="0 0 91 140" fill="none" xmlns="http://www.w3.org/2000/svg" onclick="window.location.href='clientes.jsp';">
                    <g clip-path="url(#clip0_38_262)">
                    <path d="M54.9141 98.9652L36.0865 69.9997L54.9141 41.0342" stroke="black" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                    </g>
                    <defs>
                    <clipPath id="clip0_38_262">
                    <rect width="140" height="91" fill="white" transform="matrix(0 1 -1 0 91 0)"/>
                    </clipPath>
                    </defs>
                    </svg>                        
                <h1 id="Clientes-title"> Registro de Cliente</h1> <!-- TÃ­tulo principal de la secciÃ³n superior -->
            </div>
        </div>

        <!-- Título de la sección -->
        <h3 id="cliente-datos">Datos del cliente</h3>
        <hr id="bold-line">
        
        <div class="forms-container">
            <form action="registroClientes.jsp" method="post">
                <div class="forms">
                    <div class="rows">
                        <!-- Primera fila del formulario -->
                        <div class="row1-forms">
                            <div class="form-group" id="nombre">
                                <label for="nombre">Nombre</label>
                                <input type="text" id="nombre" name="nombre" placeholder="ej. María" required>
                            </div>
                
                            <div class="form-group" id="apellido">
                                <label for="apellido">Apellido</label>
                                <input type="text" id="apellido" name="apellido" placeholder="ej. Povaz" required>
                            </div>

                            <div class="form-group" id="cedula">
                                <label for="cedula">Cedula</label>
                                <input type="text" id="cedula" name="cedula" placeholder="ej. XXXXXX-XXXXXX-XXXXXX" required>
                            </div>

                            <div class="form-group" id="correo">
                                <label for="correo">Correo personal</label>
                                <input type="email" id="correo" name="correo" placeholder="ej. maripovaz@gmail.com" required>
                            </div>
                        </div>
                        <!-- Segunda fila del formulario -->
                        <div class="row2-forms">
                            <div class="form-group" id="telefonoPersonal">
                                <label for="telefonoPersonal">Teléfono personal</label>
                                <input type="tel" id="telefonoPersonal" name="telefonoPersonal" placeholder="ej. 0000-0000" required>
                            </div>
                
                            <div class="form-group" id="telefonoResidencial">
                                <label for="telefonoResidencial">Teléfono residencial</label>
                                <input type="tel" id="telefonoResidencial" name="telefonoResidencial" placeholder="ej. 000-0000">
                            </div>
                
                            <div class="form-group" id="direccion">
                                <div class="label">
                                    <label for="Provincia">Dirección</label>
                                </div>
                                <div class="inputs">
                                    <select id="Provincia" name="provincia" required>
                                        <option value="">Provincia</option>
                                        <option value="bocas del toro">Bocas del Toro</option>
                                        <option value="chiriqui">Chiriquí­</option>
                                        <option value="cocle">Coclé</option>
                                        <option value="colon">Colón</option>
                                        <option value="darien">Darién</option>
                                        <option value="herrera">Herrrera</option>
                                        <option value="los santos">Los Santos</option>
                                        <option value="panama">Panamá</option>
                                        <option value="panama oeste">Panamá Oeste</option>
                                        <option value="veraguas">Veraguas</option>
                                    </select>
                                    <input type="text" id="cuidad" name="cuidad" placeholder="Cuidad" required>
                                    <input type="text" id="Calle" name="calle" placeholder="Calle" required>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr id="submit"> 
                <div class="options">
                    <!-- Botones de opciones -->
                    <span>
                        <button type="submit" class="Agregar">
                            Registrar
                        </button>
                    </span>
                    <button type="button" class="button-cancel" onclick="window.location.href = 'clientes.jsp';">cancelar registro</button>
                </div>
            </form>
        </div>
    </main>
    <footer class="footer-container">
        <!-- Onda decorativa en el pie de pÃ¡gina -->
        <svg class="red-wave-container" viewBox="0 0 1500 110" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path id="red-wave" d="M0 3.12128C0 3.12128 119 112.211 719 47.3469C1319 -17.5174 1500 3.12128 1500 3.12128V110H0V3.12128Z" />
        </svg>
    </footer>
    
    
        <% 
            // Recoger datos del formulario
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String cedula = request.getParameter("cedula");
            String correo = request.getParameter("correo");
            String telefonoPersonal = request.getParameter("telefonoPersonal");
            String provincia = request.getParameter("provincia");
            String ciudad = request.getParameter("cuidad");
            String calle = request.getParameter("calle");

            if (nombre != null && apellido != null && cedula != null && correo != null && telefonoPersonal != null && provincia != null && ciudad != null && calle != null) {
                // Dirección completa
                String direccion = provincia + ", " + ciudad + ", " + calle;

                Connection conn = null;
                CallableStatement stmt = null;

                try {
                    // Establecer la conexión
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "joseph", "123");

                    // Llamar al procedimiento almacenado
                    String sql = "{call insertarCliente(?, ?, ?, ?, ?, ?, ?)}";
                    stmt = conn.prepareCall(sql);

                    // Configurar los parámetros del procedimiento
                    stmt.setString(1, nombre);
                    stmt.setString(2, apellido);
                    stmt.setString(3, cedula);
                    stmt.setString(4, correo);
                    stmt.setString(5, direccion);
                    stmt.setInt(6, 2); // El 2 es el tipo de telefono en la BD 'celular'
                    stmt.setString(7, telefonoPersonal);

                    // Ejecutar el procedimiento
                    stmt.execute();


                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>Error al registrar el cliente: " + e.getMessage() + "</p>");
                } finally {
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                }
            }
        %>
</body>
</html>
