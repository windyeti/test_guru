document.addEventListener('turbolinks:load', function() {
  $('.test__edit').on('click', editLinkHandler);

  if ( $('.errors').length ) {
    var resurceId = $('.errors')[0].dataset.testId;
    showHideFormInline(resurceId)
  }
});

function editLinkHandler(e) {
  e.preventDefault();
  var resurceId = this.dataset.testId;
  showHideFormInline(resurceId)
}

function showHideFormInline(resurceId) {
  var $form = $('.form-inline[data-test-id="' + resurceId + '"]');
  var $title = $('.test__title[data-test-id="' + resurceId + '"]');
  var $link = $('.test__edit[data-test-id="' + resurceId + '"]');

  if ( $title.is(':visible') ) {
    if ($link.text() === 'Edit') $link.text("Cancel");
    if ($link.text() === 'Редактировать') $link.text("Отменить");
  } else {
    if ($link.text() === 'Cancel') $link.text("Edit");
    if ($link.text() === 'Отменить') $link.text("Редактировать");
  }
  $form.toggle();
  $title.toggle()
}
