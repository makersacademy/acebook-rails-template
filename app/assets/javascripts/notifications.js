$(document).ready(function() {
  var n = $('.activities-list').text().length;

  if(n > 0){
    $('#notification-icon').toggle();
  };

  $('#notification-icon').click(function() {
    $('.activities').toggle()
  })
});
