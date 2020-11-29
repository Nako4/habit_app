function check() {
  // クラス名actionの要素を全て取得する
  const actions = document.querySelectorAll(".action");
  actions.forEach(function(action){
    action.addEventListener("click", () => {
      const actionId = action.getAttribute("data-id")
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/habits/${actionId}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const item = XHR.response.action;
        if (item.checked === true) {
          action.setAttribute("data-check", "true");
        } else if (item.checked === false) {
          action.removeAttribute("data-check");
        }
      };

    });
  });
}
window.addEventListener("load", check);