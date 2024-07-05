<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Gestión de Clientes</title>
    <link rel="stylesheet" href="../css/ordenes.css">
</head>
<body>
    <header class="header">
        <div class="logo">
            <img src="../assets/isotipo.svg" alt="Logo de la empresa" width="300" height="150">
        </div>
        <div class="navbar_boton" onclick="window.location.href='homepageAdministracion.html';">
            <svg width="120" height="40" viewBox="0 0 120 40" fill="none">
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
                    <h1 id="Ordenes-title">Ordenes</h1> <!-- Título principal de la sección superior -->
                </div>
                <div class="upper-side-utilities">
                    <div class="utilities-searchbar">
                        <svg fill="#BE1C2D" width="20px" height="auto" viewBox="0 0 20 20">
                            <path d="M17.545 15.467l-3.779-3.779a6.15 6.15 0 0 0 .898-3.21c0-3.417-2.961-6.377-6.378-6.377A6.185 6.185 0 0 0 2.1 8.287c0 3.416 2.961 6.377 6.377 6.377a6.15 6.15 0 0 0 3.115-.844l3.799 3.801a.953.953 0 0 0 1.346 0l.943-.943c.371-.371.236-.84-.135-1.211zM4.004 8.287a4.282 4.282 0 0 1 4.282-4.283c2.366 0 4.474 2.107 4.474 4.474a4.284 4.284 0 0 1-4.283 4.283c-2.366-.001-4.473-2.109-4.473-4.474z"/>
                        </svg>
                        <input id="busqueda" type="search" placeholder="Buscar orden por codigo">
                    </div>
                    <span>
                        <button class="Agregar" onclick="window.location.href = 'registroOrden.jsp';">
                            Agregar Orden
                        </button>
                    </span>
                </div>
            </div>
        </div>

        <div class="grid-container">
        <% 
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Establecer la conexión
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "joseph", "123");

                    // Consulta SQL para obtener datos de la tabla distribuidor
                    String sql = "SELECT * FROM infoPedido";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);

                    // Iterar sobre los resultados y generar filas de la tabla
                    while (rs.next()) {
                    	String fechaEntrega = rs.getString("ProdDis_FechaEnt");
                        String nombre = rs.getString("Dis_Nombre");
                        String fecha = rs.getString("ProdDis_FechaCom");
                        String cantidad = rs.getString("ProdDis_CantidadCom");
                        String producto = rs.getString("Prod_Nombre");
                        String mensaje = (fechaEntrega != null) ? "Entregado" : "Pendiente";

                        out.println("<div class=\"grid-item\">");
                        out.println("<h2>Estado: " + mensaje + "</h2>");
                        out.println("<p>Proveedor: " + nombre + "</p>");
                        out.println("<p>Fecha pedido: " + fecha + "</p>");
                        out.println("<p>Cantidad de producto: " + cantidad + "</p>");
                        out.println("<p>Producto: " + producto + "</p>");
                        out.println("<button class=\"revisar\">Marcar como entregado</button>");
                        out.println("</div>");
                    }
                        

                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<tr><td colspan='5'>Error al obtener los datos de la vista infoPedido: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                }
            %>
           
            
        </div>
    </main>

    <footer class="footer-container">
        <div class="red-wave-container">
            <svg viewBox="0 0 1440 110" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M0 3.12128C0 3.12128 119 112.211 719 47.3469C1319 -17.5174 1440 3.12128 1440 3.12128V110H0V3.12128Z" fill="#BE1C2D"/>
            </svg>
        </div>
    </footer>
    <script src="../js/clientes.js"></script>
</body>
</html>