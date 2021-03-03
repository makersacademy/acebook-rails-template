// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  $(".like-btn").parent().on("ajax:success", updateLikes)

  function updateLikes(event) {
      let likeCountEl = $(this).parent().find(".like-count")
      let likeIconEl = $(this).parent().find(".like-btn-icon")
      let data = event.detail[0]

      if(data.error_message) {
        $('.notice').text(data.error_message)
      }
      else if(data.user_like) {
        let likeCount = data.like_count
        likeCountEl.html(`${likeCount} Like${likeCount === 1 ? "" : "s"}`);
        likeIconEl.attr("src", "heart.png");
        $(this).attr("action", `posts/${data.post_id}/likes/${data.user_like.id}`)
        $('<input type="hidden" name="_method" value="delete">').prependTo($(this))
      }
      else {
        let likeCount = data.like_count
        likeCountEl.html(`${likeCount} Like${likeCount === 1 ? "" : "s"}`);
        likeIconEl.attr("src", "like.png");
        $(this).attr("action", `posts/${data.post_id}/likes`)
        $(this).children()[0].remove();
      }

  };

})
