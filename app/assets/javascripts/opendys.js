document.addEventListener("DOMContentLoaded", function() {
  let toggleBtn = document.getElementById("toggle-opendys");
  let body = document.body;
  let title = document.querySelector('h1');
  let titleform = document.querySelector('h2');
  let description = document.querySelector('p');

  toggleBtn.addEventListener("click", function() {
    body.classList.toggle("opendys");
    title.classList.toggle("opendys");
    titleform.classList.toggle("opendys");
    description.classList.toggle("opendys");
  })
})