document.addEventListener('DOMContentLoaded', function() {
  const images = document.querySelectorAll('.thumbnail');
  images.forEach(function(image) {
      image.addEventListener('click', function() {
          image.classList.toggle('en-grand');
      });
  });
});
let isTransitioning = false;

function toggleFullscreen(element) {
if (!isTransitioning) {
  isTransitioning = true;
  setTimeout(function() {
    element.classList.toggle('en-grand');
    isTransitioning = false;
  }, 300); 
}
}