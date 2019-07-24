document.addEventListener('turbolinks:load', function() {
  document.querySelector('.card__progress-passage') && drawProgressBar();
});

function drawProgressBar() {
  var progressBar = document.querySelector('.card__progress-passage');

  var totalQuestions = progressBar.dataset.totalQuestions;
  var numberQuestion = progressBar.dataset.numberQuestion;

  var progressBarInner = document.createElement('div');
  progressBarInner.className = 'card__progress-passage__inner';

  for( var i = 0; i < totalQuestions; i++ ) {
    var rectangle = document.createElement('div');

    rectangle.className = 'card__progress-passage__rectangle bg-secondary';
    if ( i < numberQuestion - 1) rectangle.className += ' card__progress-passage__rectangle_ready bg-info';
    if ( i === numberQuestion - 1) rectangle.className += ' card__progress-passage__rectangle_current bg-warning';

    progressBarInner.appendChild(rectangle)
  }
  progressBar.appendChild(progressBarInner)
}
