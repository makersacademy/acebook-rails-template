window.onload = function() {
  const userForm = document.getElementById('user-sign-up-form')

  const email = document.getElementById('user_email')
  
  const emailError = document.querySelector('#user_email + span.error')
  
  email.addEventListener('input', function (event) {  
    if (email.validity.valid) {
      console.log(email.validity)
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
  
}

