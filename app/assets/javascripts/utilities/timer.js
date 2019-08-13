document.addEventListener('turbolinks:load', function() {
  document.querySelector('#timer') && runTimer();
});

function runTimer() {
  var timer = document.querySelector('#timer');
  var testPassageId = timer.dataset.testPassageId;
  setInterval(function() { timeout(timer, testPassageId) },1000)
}

function timeout(timer, testPassageId) {
  timer.textContent -= 1;
  if (timer.textContent <= 0) window.location.replace(`/test_passages/${testPassageId}/result`)
}
