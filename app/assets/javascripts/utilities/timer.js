document.addEventListener('turbolinks:load', function() {
  document.querySelector('#timer') && testTimer();
});

function testTimer() {
  var timer = document.querySelector('#timer');
  var timeRest = timer.dataset.timeRest;
  var testPassageId = timer.dataset.testPassageId;
  setInterval(function() {
    timeRest = decrement(timeRest);
    timer.innerHTML = Math.round(timeRest);
    if (timeRest <= 0) window.location.replace('/test_passages/' + testPassageId + '/result');
    // if (timeRest <= 0) $("#form_test_passage").submit();
  },1000)
}

function decrement(value) {
  return value - 1
}
