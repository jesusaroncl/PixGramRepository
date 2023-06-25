
const slides = document.querySelectorAll('.containerTestimonio');
const prevButton = document.querySelector('.prev-button');
const nextButton = document.querySelector('.next-button');
const dotsContainer = document.querySelector('.dots');
let currentSlide = 1;

prevButton.style.display = 'none';
nextButton.style.display = 'none';

function showSlide(slideIndex) {
  slides.forEach((slide, index) => {
    slide.style.display = index === slideIndex ? 'grid' : 'none';
  });

  const dots = document.querySelectorAll('.dot');
  dots.forEach((dot, index) => {
    dot.classList.toggle('active-dot', index === slideIndex);
  });
}

function prevSlide() {
  currentSlide--;
  if (currentSlide < 0) {
    currentSlide = slides.length - 1;
  }
  showSlide(currentSlide);
}

function nextSlide() {
  currentSlide++;
  if (currentSlide >= slides.length) {
    currentSlide = 0;
  }
  showSlide(currentSlide);
}

prevButton.addEventListener('click', prevSlide);
nextButton.addEventListener('click', nextSlide);

slides.forEach((slide, index) => {
  const dot = document.createElement('div');
  dot.classList.add('dot');
  dot.addEventListener('click', () => showSlide(index));
  dotsContainer.appendChild(dot);
});

showSlide(currentSlide);


document.addEventListener('DOMContentLoaded', function() {
  // Obtener los elementos del navbar
  const sobreNosotrosLink = document.querySelector('.SobreNosotros');
  const tutorialesLink = document.querySelector('.Tutoriales');
  const testimoniosLink = document.querySelector('.Testimonios');
  const sobreNosotrosSection = document.querySelector('.containerSobreNosotros');
  const tutorialesSection = document.querySelector('.containerComoFunciona');
  const testimoniosSection = document.querySelector('.hTSM');

  // Agregar evento de clic al enlace de Servicios
  sobreNosotrosLink.addEventListener('click', function(e) {
    e.preventDefault(); // Prevenir el comportamiento predeterminado del enlace
    sobreNosotrosSection.scrollIntoView({ behavior: 'smooth' }); // Desplazarse a la sección de Servicios
  });

  // Agregar evento de clic al enlace de Portafolio
  tutorialesLink.addEventListener('click', function(e) {
    e.preventDefault(); // Prevenir el comportamiento predeterminado del enlace
    tutorialesSection.scrollIntoView({ behavior: 'smooth' }); // Desplazarse a la sección de Portafolio
  });

  testimoniosLink.addEventListener('click', function(e) {
      e.preventDefault(); // Prevenir el comportamiento predeterminado del enlace
      testimoniosSection.scrollIntoView({ behavior: 'smooth' }); // Desplazarse a la sección de Portafolio
    });
});


