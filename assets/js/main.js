const target = document.getElementById("typed-text");
const reducedMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

function typeEffect(text = "whoami") {
  if (!target) return;
  if (reducedMotion) {
    target.textContent = text;
    return;
  }

  let index = 0;
  const tick = () => {
    if (index >= text.length) return;
    target.textContent += text.charAt(index++);
    window.setTimeout(tick, 95);
  };
  tick();
}

window.addEventListener("DOMContentLoaded", () => {
  typeEffect();
});
