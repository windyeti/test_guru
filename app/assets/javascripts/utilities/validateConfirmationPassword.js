document.addEventListener('turbolinks:load', function() {
  var field_confirmation = document.getElementById('user_password_confirmation');
  var field_password = document.getElementById('user_password');
  field_confirmation.addEventListener('input', validationConfirmationPassword)
  field_password.addEventListener('input', validationConfirmationPassword)
});

function validationConfirmationPassword() {
  var field_password = document.getElementById('user_password');
  var field_confirmation = document.getElementById('user_password_confirmation');

  var value_password = field_password.value;
  var value_confirmation = field_confirmation.value;

  if (value_confirmation === value_password && value_password !== '') {
    show_sign('issue-closed')
  }
  else {
    show_sign('issue-opened')
  }

  if (value_confirmation === '') show_sign(null);
}

function show_sign(sign) {
  var issue_opened = document.querySelector('.octicon-issue-opened');
  var issue_closed = document.querySelector('.octicon-issue-closed');
  var arrSign = [issue_opened, issue_closed];

  arrSign.forEach(function(sign) {
    sign.classList.add('hide')
  });
  if (sign === 'issue-opened') {
    issue_opened.classList.remove('hide');
  }
  if (sign === 'issue-closed') {
    issue_closed.classList.remove('hide');
  }
}

