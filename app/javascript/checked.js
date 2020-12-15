window.addEventListener('load', function(){

  let days = document.getElementsByClassName("days")
  days = Array.from(days);
  days.forEach(function (day) {
    day.addEventListener("click", () => {
      const dayText = day.innerHTML.trim();
      document.getElementById('date-record').value = dayText
      const dayPanel = day.parentNode
      console.log(dayPanel)
      
    });
  });

  $(function(){
    let countAll = $('input:checkbox').length;
    console.log(countAll)
    $('input:checkbox').change(function(){
      // let countCheck = $('#action-list input:checkbox:checked').length;
      //idをいれるとなぜか一番上しかカウントされない。
      
      let countCheck = $('input:checkbox:checked').length;
      let achieveRate = countCheck / countAll　* 100
      $('span.achieve-count').text(achieveRate);
      const achieveValue = document.getElementById('form-value')
      $('input.form-value').val(achieveRate);
    }).trigger('change');
  })

});