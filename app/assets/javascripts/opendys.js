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

window.onload = function () {
  // Apply font preference on page load
  applyFontPreference();

  // Add event listener to the button
  document
    .getElementById("toggle-opendys")
    .addEventListener("click", function () {
      // Toggle font preference
      var isDyslexic = localStorage.getItem("opendys");
      localStorage.setItem(
        "opendys",
        isDyslexic !== "true" ? "true" : "false",
      );

      // Apply updated font preference
      applyFontPreference();
    });
};