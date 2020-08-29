const pay = () => {
  Payjp.setPublicKey("pk_test_8fbbf95ba7e7d058d3a12f7f");　// PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("deliverie_purchase[number]"),
      cvc: formData.get("deliverie_purchase[cvc]"),
      exp_month: formData.get("deliverie_purchase[exp_month]"),
      exp_year: `20${formData.get("deliverie_purchase[exp_year]")}`,
    };
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      } else {
        console.log(response.error.message)
        const submitBtn = document.getElementsByClassName("buy-red-btn")[0];
        submitBtn.disabled = false;
      }
    });
  });
};

window.addEventListener("load", pay);