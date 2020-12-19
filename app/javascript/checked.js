window.addEventListener('load', function(){

  let days = document.getElementsByClassName("days")
  days = Array.from(days);
  days.forEach(function (day) {
    day.addEventListener("click", () => {
      const dayText = day.innerHTML.trim();
      document.getElementById('date-record').value = dayText
      
    });

  



  });

    //達成度のかかれたパネルを取得
    //パネルの数値を取得
    //数値に応じてパネルの背景色を変更

  let achievePanels = document.getElementsByClassName("achieve-rate")
  achievePanels = Array.from(achievePanels);
  console.log(achievePanels)
    achievePanels.forEach(function (achievePanel) {
      const dayPanel = achievePanel.parentNode
      const achieveValueElement = achievePanel.innerHTML
      const achieveValue = Number( achieveValueElement.replace(/[^0-9]/g, '') )
      console.log(achieveValue)
      if (achieveValue >=80) {
        dayPanel.style.backgroundColor = "#12DD09";
      } else if (achieveValue >= 60) {
        dayPanel.style.backgroundColor = "#2FF626";
      } else if (achieveValue >= 40) {
        dayPanel.style.backgroundColor = "#89F983";
      } else if (achieveValue >= 20) {
        dayPanel.style.backgroundColor = "#D1FDCF";
      } 

      
    })


  $(function(){
    let countAll = $('input:checkbox').length;
    $('input:checkbox').change(function(){
      // let countCheck = $('#action-list input:checkbox:checked').length;
      //idをいれるとなぜか一番上しかカウントされない。
      
      let countCheck = $('input:checkbox:checked').length;
      let achieveRate = countCheck / countAll　* 100
      $('span.achieve-count').text(achieveRate);
      // const achieveValue = document.getElementById('form-value')
      $('input.form-value').val(achieveRate);
    }).trigger('change');
  })

});