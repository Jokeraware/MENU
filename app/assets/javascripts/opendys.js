document.addEventListener("turbo:load", function () {
  let toggleBtn = document.getElementById("toggle-opendys");
  let body = document.body;
  let title = document.querySelector('h1');
  let titleform = document.querySelector('h2');
  let opendysEnabled = localStorage.getItem("opendysActive");

  // Vérifier si OpenDys est activé
  if (opendysEnabled === "true") {
    body.classList.add("opendys");
    title.classList.add("opendys");
    titleform.classList.add("opendys");
  }

  toggleBtn.addEventListener("turbo:click", function () {
    // Inverser opendys en true
    let CurrentlyActive = body.classList.toggle("opendys");

    // Enregistrer l'état dadns un stockage local
    localStorage.setItem("opendysActive", CurrentlyActive);
  });
});