document.addEventListener('turbolinks:load', function() {
  document.querySelector('.card__progress_passage') && drawProgressBar();
});

function drawProgressBar() {
  var progress_bar = document.querySelector('.card__progress_passage');

  var total_questions = progress_bar.dataset.totalQuestions;
  var number_question = progress_bar.dataset.numberQuestion;

  var progress_bar_inner = document.createElement('div');
  progress_bar_inner.className = 'card__progress_passage__inner';

  for( var i = 0; i < total_questions; i++ ) {
    var rectangle = document.createElement('div');

    rectangle.className = 'card__progress_passage__rectangle bg-secondary';
    if ( i < number_question - 1) rectangle.className += ' card__progress_passage__rectangle_ready bg-info';
    if ( i === number_question - 1) rectangle.className += ' card__progress_passage__rectangle_current bg-warning';

    progress_bar_inner.appendChild(rectangle)
  }
    progress_bar.appendChild(progress_bar_inner)
}
