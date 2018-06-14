$(document).ready(function() {
  var n = $('.activities-list').text().length;

  if(n > 0){
    $('#notifications').css('background-color', 'red');
  };

  $('#notifications').click(function() {
    $('.activities').toggle()
  })
});
