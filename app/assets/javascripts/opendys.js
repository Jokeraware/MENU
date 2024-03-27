function applyFontPreference() {
  var isDyslexic = localStorage.getItem("opendys");
  if (isDyslexic === "true") {
    document.body.style.setProperty(
      "font-family",
      "OpenDyslexic",
      "important",
    );
  } else {
    document.body.style.removeProperty("font-family");
  }
}

function applyH1FontPreference() {
  var isDyslexic = localStorage.getItem("opendys");
  var h1Elements = document.querySelector("h1");

  if (isDyslexic === "true") {
    h1Elements.style.setProperty(
      "font-family",
      "OpenDyslexic",
      "important"
      );
  } else {
    h1Elements.style.removeProperty("font-family");
  }
}

function toggleOpenDyslexic() {
  // Toggle font preference
  var isDyslexic = localStorage.getItem("opendys");
  localStorage.setItem(
    "opendys",
    isDyslexic !== "true" ? "true" : "false",
  );

  // Apply updated font preference
  applyFontPreference();
  applyH1FontPreference();
}



window.onload = function () {
  // Apply font preference on page load
  applyFontPreference();
  applyH1FontPreference();

  // Add event listener to the button
  document
    .getElementById("toggle-opendys")
    .addEventListener("click", toggleOpenDyslexic);
};