// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.
//
//
$(document).ready(function() {

  // var likesCount = $(".likes-count-js").data("likes");

  $('.like-button').on('click', function(event) {
    event.preventDefault();
    let postID = $(this).parent().parent().parent().attr('id')
    $.post(`/api/posts/${postID}/likes`, function() {
      let $post = $(`#${postID}`);
      $post.find('.like-button').attr('value', 'Unlike')
      $post.find('.like-button').switchClass('like-button', 'unlike-button')
      let currentLikesCount = $post.find('.like-count').text().split()[0]
      let updatedLikesCountText = `${currentLikesCount + 1} Likes`
      $post.find('.like-count').text(updatedLikesCountText);
    })
  })

  $('.unlike-button').on('click', function(event) {
    event.preventDefault();
    let postID = $(this).parent().parent().parent().attr('id')
    $.ajax({
    url: `/posts/${postID}/likes/42`,
    type: 'DELETE',
    success: function(result) {
        $('.unlike-button').attr('value', 'Like')
        $('.unlike-button').switchClass('unlike-button', 'like-button')
        // $(document).find('.like-count').html((likesCount - 1) + ' Likes');
      }
    })
  })


//   $('.like-button').on('click', function() {
//     $(document).find('.like-button').attr('value', 'Unlike')
//     $(document).find('.like-count').html(likesCount + 1 + ' Likes');
//   })
//
//   $('.unlike-button').on('click', function() {
//     $(document).find('.unlike-button').attr('value', 'Like')
//     $(document).find('.like-count').html(likesCount - 1 + ' Likes');
//   })
})
