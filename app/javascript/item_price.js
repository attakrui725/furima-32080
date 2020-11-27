window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price")
const add_Tax = document.getElementById("add-tax-price")
const profit = document.getElementById("profit")

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;  
  let fee = inputValue * 0.1;  
  add_Tax.textContent = Math.floor(fee);

 let profita = inputValue - fee;
  profit.textContent = profita;
})
});
