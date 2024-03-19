document.addEventListener("DOMContentLoaded", function() {
  let toggleBtn = document.getElementById("toggle-opendys");
  let body = document.body;
  let title = document.querySelector('h1');

  toggleBtn.addEventListener("click", function() {
    body.classList.toggle("opendys");
    title.classList.toggle("opendys");
  })
})