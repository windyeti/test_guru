document.addEventListener('turbolinks:load', function() {
  document.querySelector('#timer') && testTimer();
});

function testTimer() {
  var timer = document.querySelector('#timer');
  var timeRest = timer.dataset.timeRest;
  var interval = setInterval(function() {
    timeRest = decrement(timeRest);
    var timeRestRound = Math.round(timeRest);
    timer.innerHTML = timeRestRound >= 0 ? timeRestRound : '--' ;
    if (timeRest <= 0) {
      $("#form_test_passage").submit();
      clearInterval(interval);
    }
  },1000)
}

function decrement(value) {
  return value - 1
}
