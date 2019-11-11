// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function () {
  $('#testjq').text($('#testjq').attr('name'));

  $('a').click(function(event) {
    console.log()
    $('#testjq').text($(`#${event.target.id}`).attr('value'));
    if(event.target.text === '👎') {
      $(`#${event.target.id}`).text('👅');
    } else {
      $(`#${event.target.id}`).text('👎');
    }
    Rails.ajax({
      url: "/likes",
      type: "get",
      data: "",
      success: function(data) {},
      error: function(data) {}
    })
  });


});
