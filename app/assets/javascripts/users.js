window.onload = function() {
  const userForm = document.getElementById('user-sign-up-form')

  const email = document.getElementById('user_email')

  const emailError = document.querySelector('#user_email + span.error')

  email.addEventListener('input', function (event) {
    if (email.validity.valid) {
      emailError.textContent = '';
      emailError.className = 'error';
    } else {
      showError();
    }
  });

  function showError() {
    if (email.validity.valueMissing) {
      emailError.textContent = "You need to enter an email address."
    } else if (email.validity.typeMismatch) {
      emailError.textContent = "Entered value needs to be an email address."
    }
    emailError.className = 'error active';
  }



  const password = document.getElementById('user_password')

  const passwordError = document.querySelector('#user_password + span.error')

  password.addEventListener('input', function (event) {
    if (password.validity.valid) {
      console.log('hello')
      passwordError.textContent = '';
      passwordError.className = 'error';
    } else {
      console.log('hi')
      passwordShowError();
    }
  });

  function passwordShowError() {
    if (password.validity.valueMissing) {
      passwordError.textContent = "You need to enter a password."
      console.log(passwordError.textContent)
    } else if (password.validity.tooShort) {
      passwordError.textContent = "Password too short."
      console.log(passwordError.textContent);
    }
    passwordError.className = 'error active';
  }

}
