// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {

$('#comment_form').hide(); //Initially form wil be hidden.

 $('#new_comment').click(function() {
  $('#comment_form').slideToggle('slow');//Form shows on button click

  });
});
