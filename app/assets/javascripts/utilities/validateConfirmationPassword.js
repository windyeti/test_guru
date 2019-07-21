document.addEventListener('turbolinks:load', function() {
  var field_confirmation = document.getElementById('user_password_confirmation');
  var field_password = document.getElementById('user_password');
  field_confirmation.addEventListener('input', validationConfirmationPassword)
  field_password.addEventListener('input', validationPassword)
});

function validationConfirmationPassword() {
  var value_password = document.getElementById('user_password').value;
  var value_confirmation = this.value;

  var issue_opened = this.parentNode.querySelector('.octicon-issue-opened');
  var issue_closed = this.parentNode.querySelector('.octicon-issue-closed');

  if (value_confirmation === value_password) {
    issue_opened.classList.add('hide');
    issue_closed.classList.remove('hide');
  }
  else {
    issue_opened.classList.remove('hide');
    issue_closed.classList.add('hide');
  }

  if (value_confirmation === '') {
    issue_opened.classList.add('hide');
    issue_closed.classList.add('hide');
  }
}

function validationPassword() {
  var field_confirmation = document.getElementById('user_password_confirmation');
  var value_confirmation = field_confirmation.value;
  var value_password = this.value;

  var issue_opened = field_confirmation.parentNode.querySelector('.octicon-issue-opened');
  var issue_closed = field_confirmation.parentNode.querySelector('.octicon-issue-closed');

  if (value_confirmation === value_password && value_password !== '') {
    issue_opened.classList.add('hide');
    issue_closed.classList.remove('hide');
  }
  else {
    issue_opened.classList.remove('hide');
    issue_closed.classList.add('hide');
  }
}
