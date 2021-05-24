function Calculation (){
  const price = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  price.addEventListener("keyup", () => {
    // e.preventDefault();
    console.log(price.value);
    addTaxPrice.innerHTML = Math.floor(price.value * 0.1);
    profit.innerHTML = Math.ceil(price.value * 0.9);
  })
};

window.addEventListener('load', Calculation);