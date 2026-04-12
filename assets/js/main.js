const text = "whoami";
const target = document.getElementById("typed-text");

let index = 0;

function typeEffect() {
  if (!target) return;

  if (index < text.length) {
    target.textContent += text.charAt(index);
    index += 1;
    setTimeout(typeEffect, 120);
  }
}

window.addEventListener("DOMContentLoaded", () => {
  typeEffect();
});
