window.addEventListener('load', function(){
  const ItemPrice = document.getElementById("item-price");
  ItemPrice.addEventListener("input", () => {
    const inputValue = ItemPrice.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)

    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML)
  })
})