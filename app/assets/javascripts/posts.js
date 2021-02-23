// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

  $(document).on('mouseenter', '.post', function(){
    $(this).css("background", "whitesmoke");
  });

  $(document).on('mouseleave', '.post', function(){
    $(this).css("background", "white");
  });

});