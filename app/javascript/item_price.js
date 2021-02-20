const price_calc = () => {
  const price = document.getElementById("item-price");
  price.addEventListener("input", () => {
    const priceValue = price.value;
    // 販売手数料の計算 
    const salesCommission = document.getElementById("add-tax-price");
    salesCommission.innerHTML = Math.floor(priceValue / 10);
    // 販売利益の計算
    const salesProfit = document.getElementById("profit");
    const commission = Math.floor(priceValue / 10);
    salesProfit.innerHTML = Math.floor(priceValue - commission);
  });
};
window.addEventListener("load", price_calc);