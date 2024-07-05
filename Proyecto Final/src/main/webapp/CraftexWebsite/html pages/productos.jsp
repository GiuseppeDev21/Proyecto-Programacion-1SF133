<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es"> <!-- Define el idioma de la página como español -->
<head>
    <meta charset="UTF-8"> <!-- Establece la codificación de caracteres a UTF-8 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Configura la vista para dispositivos móviles -->
    <title>Sistema de Gesti�n de Productos</title> <!-- Título de la página que se muestra en la pestaña del navegador -->
    <link rel="stylesheet" href="../css/productos.css"> <!-- Vincula la hoja de estilos CSS -->
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
    <main>
        <div class="upper-side-container">
            <div class="upper-side">
                <div class="upper-side-title">
                    <svg width="91" height="140" viewBox="0 0 91 140" fill="none" xmlns="http://www.w3.org/2000/svg" onclick="window.location.href='homepageAdministracion.html';">
                        <g clip-path="url(#clip0_38_262)">
                            <path d="M54.9141 98.9652L36.0865 69.9997L54.9141 41.0342" stroke="black" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                        </g>
                        <defs>
                            <clipPath id="clip0_38_262">
                                <rect width="140" height="91" fill="white" transform="matrix(0 1 -1 0 91 0)"/>
                            </clipPath>
                        </defs>
                    </svg>                        
                    <h1 id="Productos-title">Productos</h1> <!-- Título principal de la sección superior -->
                </div>
                <div class="upper-side-utilities">
                    <div class="utilities-left">
                        <h1>Inventario</h1> <!-- Título de la sección de inventario -->
                        <h4 id="productos-cantidad">Cantidad de productos en inventario: </h4> <!-- Cantidad de productos en inventario -->
                    </div>
                    <span>
                        <button class="Agregar" onclick="window.location.href = 'registroProductos.jsp';">
                            Agregar Producto <!-- Bot�n para agregar un nuevo producto -->
                        </button>
                    </span>
                </div>
            </div>
        </div>
    
        <table>
            <hr id="bold-line"> <!-- L�nea horizontal estilizada -->
            <thead>
                <tr>
                    <th>C�digo</th> <!-- Encabezado de la columna para el c�digo del producto -->
                    <th>Nombre</th> <!-- Encabezado de la columna para el nombre del producto -->
                    <th>Precio</th> <!-- Encabezado de la columna para el precio del producto -->
                    <th>Cantidad</th> <!-- Encabezado de la columna para la cantidad del producto -->
                </tr>
            </thead>
            <tbody>
                <% 
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Establecer la conexi�n
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "joseph", "123");

                    // Consulta SQL para obtener datos de la tabla Clientes
                    String sql = "SELECT * FROM producto ORDER BY prod_cod";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    // Iterar sobre los resultados y generar filas de la tabla
                    while (rs.next()) {
                    	String id = rs.getString("prod_cod");
                        String nombre = rs.getString("prod_nombre");
                        String precio = rs.getString("prod_precio");
                        String cantidad = rs.getString("prod_cantidad");
                        
                        
                        out.println("<tr>");
                        out.println("<td>" + id + "</td>");
                        out.println("<td>" + nombre + "</td>");
                        out.println("<td>" + precio + "</td>");
                        out.println("<td>" + cantidad + "</td>");
                        out.println("</tr>");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<tr><td colspan='5'>Error al obtener los datos de la tabla Producto: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                }
            %>
            </tbody>
        </table>
        <div class="pagination-container"> 
            <div class="pagination">
                <button onclick="mostrarPaginaAnterior()"></button> <!-- Boton para mostrar pagina anterior -->
                <div id="contenedor-paginas"></div> <!-- Contenedor para los números de página -->
                <button onclick="mostrarPaginaSiguiente()"></button> <!-- Boton para mostrar pagina siguiente -->
            </div>
        </div>
    </main>
    <footer>
        <div class="wave" style="height: 110px; overflow: hidden;" ><svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 100%; width: 100%;"><path d="M0.00,49.98 C150.00,150.00 264.13,-49.98 500.00,49.98 L500.00,150.00 L0.00,150.00 Z" style="stroke: none; fill: #BE1C2D;"></path></svg></div>
    </footer>
    <script src="../js/productos.js"></script> <!-- Vincula el archivo de JavaScript -->
</body>
</html>
