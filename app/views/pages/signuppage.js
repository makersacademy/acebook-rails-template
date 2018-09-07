
document.getElementById('hidePassword').addEventListener('click', function(){
  var passwordInput = document.getElementById('password');
  if (passwordInput.getAttribute('type') == 'text') {
        passwordInput.setAttribute('type', 'password');
      };
});

document.getElementById('login').addEventListener('click', function(){
  var button = document.getElementById('signUp');
  button.innerHTML = 'Log In';
});
