const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number:    formData.get("item_purchase[card_number]"),
      exp_month: formData.get("item_purchase[exp_month]"),
      exp_year:  `20${formData.get("item_purchase[exp_year]")}`,
      cvc:       formData.get("name=item_purchase[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("item_purchase[card_number]").removeAttribute("name");
      document.getElementById("item_purchase[exp_month]").removeAttribute("name");
      document.getElementById("item_purchase[exp_year]").removeAttribute("name");
      document.getElementById("item_purchase[cvc]").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);