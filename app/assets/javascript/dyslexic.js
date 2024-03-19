document.addEventListener("DOMContentLoaded", function() {
    let toggleBtn = document.getElementById("toggle-opendys");
    let body = document.body;
  
    toggleBtn.addEventListener("click", function() {
      body.classList.toggle("dyslexic");
      ("body").toggleClass("active");
    })
  }) 