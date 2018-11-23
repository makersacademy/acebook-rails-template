// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $('#like_form').submit(function(event) {
    $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: $(event).serialize(),
      dataType: 'JSON'
    }).then(json => { console.log('success', json) })

    return false;
  });

  $('#unlike_form').submit(function(event) {
    event.preventDefault()
    $.post($('#unlike-form').attr('action'), data).then(function(data) {
      console.log(data)
    });
  })

});
