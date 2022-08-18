function fluctuation (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/items", true);
    XHR.responseType = "json";
    XHR.send(formData);
  });
};

window.addEventListener('load', fluctuation);