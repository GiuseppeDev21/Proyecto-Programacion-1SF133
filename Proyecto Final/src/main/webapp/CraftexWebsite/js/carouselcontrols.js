// JavaScript para la funcionalidad del carousel
const slides = document.querySelectorAll('.carousel-slide');
const dots = document.querySelectorAll('.dot');

let currentSlide = 0;

// Función para mostrar el slide actual y actualizar los puntos
function showSlide(index) {
    slides.forEach((slide) => {
        slide.style.display = 'none';
    });
    dots.forEach((dot) => {
        dot.classList.remove('active');
    });

    slides[index].style.display = 'block';
    dots[index].classList.add('active');
    currentSlide = index;
}

// Event listeners para los controles de puntos
dots.forEach((dot, index) => {
    dot.addEventListener('click', () => {
        showSlide(index);
    });
});

// Mostrar el primer slide al cargar la página
showSlide(currentSlide);
