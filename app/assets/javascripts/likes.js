// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $('.like-button').click(function(event) {
    console.log(event)
    event.preventDefault()
  });
  //
  // function incrementLikes() {
  //   var newLikes = parseInt(document.getElementById('likes-number').innerHTML) + 1;
  //   document.getElementById('likes-number').innerHTML = newLikes;
  // }

});
