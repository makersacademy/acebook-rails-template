// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {

  $('.like-button').on('click', function() {
    // console.log(this.parent)
    $(document).find('.like-count').text('<%= post.likes.count %>');
  })
})
