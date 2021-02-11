// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function closeModal(){
  $('.modal').modal('hide');
}

function closeForm(){
  $('#comment_form').collapse('hide');
}

function extendFooter(){
  if ($('.nothing-here').is(":visible")){
    $('.footer').css("position", "fixed");
  }else{
    $('.footer').css("position", "static");
  }
}

$( document ).ready(function() {
  extendFooter();

  $('#myTab a').click( function(){
    if ($('.nothing-here').is(":visible")){
      $('.footer').css("position", "static");
    }else{
      $('.footer').css("position", "fixed");
    }
  });
});