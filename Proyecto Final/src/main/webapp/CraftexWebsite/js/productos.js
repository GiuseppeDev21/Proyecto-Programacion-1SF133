const elementosPorPagina = 5; // Muestra 5 filas por página
const listaFilas = document.querySelector('tbody').querySelectorAll('tr');
let totalClientes = listaFilas.length;
const numeroPaginas = Math.ceil(listaFilas.length / elementosPorPagina);

function mostrarCantidadItems() {
    const h4 = document.getElementById('productos-cantidad');
    h4.innerHTML = `Cantidad de productos en inventario: ${totalClientes}`;
}

mostrarCantidadItems()

function mostrarPagina(pagina) {
    const inicio = (pagina * elementosPorPagina) - elementosPorPagina;
    const fin = inicio + elementosPorPagina - 1;
  
    for (let i = 0; i < listaFilas.length; i++) {
      if (i >= inicio && i <= fin) {
        listaFilas[i].style.display = '';
      } else {
        listaFilas[i].style.display = 'none';
      }
    }
}

const contenedorPaginas = document.getElementById('contenedor-paginas');

function generarPaginacion() {
    contenedorPaginas.innerHTML = ''; // Limpia el contenedor antes de generar nuevos botones

    for (let i = 1; i <= numeroPaginas; i++) {
        const boton = document.createElement('button');
        boton.textContent = i;
        boton.dataset.pagina = i; // Almacena el número de página en un atributo 'data-pagina'
        boton.onclick = function() {
        mostrarPagina(parseInt(this.dataset.pagina)); // Llama a mostrarPagina con el número de página del botón
        };

        contenedorPaginas.appendChild(boton);
    }
}

generarPaginacion(); // Llama a la función para generar la paginación al cargar la página

function mostrarPaginaAnterior() {
    let paginaActual = parseInt(document.querySelector('.pagina-actual').dataset.pagina);
    if (paginaActual > 1) {
      mostrarPagina(paginaActual - 1);
    }
}
  
function mostrarPaginaSiguiente() {
    let paginaActual = parseInt(document.querySelector('.pagina-actual').dataset.pagina);
    if (paginaActual < numeroPaginas) {
        mostrarPagina(paginaActual + 1);
    }
}

function resaltarPaginaActual() {
    const botonesPaginas = document.querySelectorAll('.pagination button');
    botonesPaginas.forEach(boton => {
        boton.classList.remove('pagina-actual'); // Elimina la clase de todas las páginas
    });

    const paginaActual = document.querySelector(`.pagination button[data-pagina="${paginaActual}"]`);
    if (paginaActual) {
        paginaActual.classList.add('pagina-actual'); // Agrega la clase a la página actual
    }
}

mostrarPagina(1); // Muestra la página 1 al cargar la página
resaltarPaginaActual(); // Resalta la página 1 como actual
