// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.
//
//
$(document).ready(function() {

  function unlikePost(postID) {
    let $post = $(`#${postID}`);

    $.ajax({
      url: `/api/posts/${postID}/likes`,
      type: 'DELETE',
      success: function() {
        $post.find('.toggle-like').html('🐴');
        $.get(`/api/posts/${postID}/likes`, function(response) {
          let likesCount = response.length
          let likeOrLikes = (likesCount == 1) ? 'Like' : 'Likes'
          $post.find('.like-count').text(`${likesCount} ${likeOrLikes}`)
        })
      }
    })
  }

  function likePost(postID) {
    let $post = $(`#${postID}`);

    $.post(`/api/posts/${postID}/likes`, function() {
      $post.find('.toggle-like').html('🦄');
      $.get(`/api/posts/${postID}/likes`, function(response) {
        let likesCount = response.length
        let likeOrLikes = (likesCount == 1) ? 'Like' : 'Likes'
        $post.find('.like-count').text(`${likesCount} ${likeOrLikes}`)
      })
    })
  }

  $('.toggle-like').on('click', function(event) {
    event.preventDefault();
    let $button = $(this);
    let postID = $button.parent().parent().attr('id')
    if ($button.html() === '🦄') {
      unlikePost(postID);
    } else {
      likePost(postID);
    }
  })

})
