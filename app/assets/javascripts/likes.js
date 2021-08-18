document.addEventListener('DOMContentLoaded', (event) => {
  console.log('DOM fully loaded and parsed');
  const button = document.querySelectorAll('.button_to')
  // let fn = function(e) { e.preventDefault() };
  for ( var i = 0; i < button.length; i++) {
    button[i].addEventListener('click', (e) => {
    console.log('Button pressed!!!!')
    // e.preventDefault()
    e.stopPropagation()
  })
  }
  })


// var buttons = document.querySelectorAll('button'),
//     fn      = function(e) { e.preventDefault() };

// for ( var i = buttons.length; i--; ) {
//     buttons[i].addEventListener('click', fn, false);
// }