<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Gestión de Orden</title>
    <link rel="stylesheet" href="../css/registroOrdenes.css">
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
            <div class="upper-side-title">
                <svg width="91" height="140" viewBox="0 0 91 140" fill="none" xmlns="http://www.w3.org/2000/svg" onclick="window.location.href='ordenes.jsp';">
                    <g clip-path="url(#clip0_38_262)">
                    <path d="M54.9141 98.9652L36.0865 69.9997L54.9141 41.0342" stroke="black" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                    </g>
                    <defs>
                    <clipPath id="clip0_38_262">
                    <rect width="140" height="91" fill="white" transform="matrix(0 1 -1 0 91 0)"/>
                    </clipPath>
                    </defs>
                    </svg>                        
                <h1 id="Producto-title"> Registro de Orden</h1> <!-- Título principal de la sección superior -->
            </div>
        </div>

        <!-- TÃ­tulo de la secciÃ³n -->
        <h3 id="cliente-datos">Datos de la orden</h3>
        <hr id="bold-line">
        
        <div class="forms-container">
            <form action="registroOrden.jsp" method="post">
                <div class="forms">
                    <div class="rows">
                        <!-- Fila del formulario -->
                        <div class="row1-forms">
                            <div class="form-group" id="nombre">
                                <label for="nombre">Nombre del Producto</label>
                                <select name="producto" id="nombre">
  									<option value="">Producto</option>
  									<option value="1">Cemento</option>
  									<option value="2">Arena</option>
  									<option value="3">Grava</option>
  									<option value="4">Ladrillos</option>
  									<option value="5">Viga de Acero</option>
  									<option value="6">Tuberías de PVC</option>
 									<option value="7">Clavos 35mm</option>
  									<option value="8">Tornillos de 35mm</option>
  									<option value="9">Tablones de madera</option>
  									<option value="10">Paneles de Yeso</option>
  									<option value="11">Brochas de Pintura</option>
  									<option value="12">Aceite de Carro</option>
  									<option value="13">Mesa de Trabajo</option>
  									<option value="14">Computadora</option>
								</select>
                            </div>
                
                            <div class="form-group" id="cantidad">
                                <label for="cantidad">Cantidad</label>
                                <input type="number" id="cantidad" name="cantidad" min="0" placeholder="0" required>
                            </div>
                
                            <div class="form-group" id="distribuidor">
                                <label for="distribuidor">Distribuidor</label>
                                <select name="distribuidor">
                                	<option value="1">Distribuidora Alpha</option>
  									<option value="1">Distribuidora Alpha</option>
 	 								<option value="2">Distribuciones Beta</option>
  									<option value="3">Suministros Gamma</option>
  									<option value="4">Proveedores Delta</option>
  									<option value="5">Materiales Epsilon</option>
  									<option value="6">Ferretería Zeta</option>
  									<option value="7">Herramientas Eta</option>
  									<option value="8">Suministros Theta</option>
  									<option value="9">Distribuidora Iota</option>
  									<option value="10">Proveedores Kappa</option>
								</select>
                            </div>
                        </div>
                    </div>
                </div>
                <hr id="submit"> 
                <div class="options">
                    <!-- Botones de opciones -->
                    <span>
                        <button type="submit">
                            Registrar
                        </button>
                    </span>
                    <button type="button" class="button-cancel" onclick="window.location.href = 'ordenes.jsp';">cancelar registro</button>
                </div>
            </form>
        </div>
    </main>
    <footer class="footer-container">
        <!-- Onda decorativa en el pie de página -->
        <svg class="red-wave-container" viewBox="0 0 1500 110" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path id="red-wave" d="M0 3.12128C0 3.12128 119 112.211 719 47.3469C1319 -17.5174 1500 3.12128 1500 3.12128V110H0V3.12128Z" />
        </svg>
    </footer>
    <script src="#"></script>
   
</body>
</html>
