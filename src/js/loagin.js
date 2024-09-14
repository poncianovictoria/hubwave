let elem_preloader = document.getElementById("frame");
let elem_loader = document.getElementById("grid");
console.log("Testing... Ok");


setTimeout(function() {
  elem_preloader.classList.remove("frame");
  elem_loader.classList.remove("grid");
  }, 1280);