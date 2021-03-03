// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


// // In this file, have
// - Update Display with number of likes
// - Update display to change icon
//
// // In index.html.erb
// - Add remote: true to the button_to for each like button
// - Add on_success JS call to the buttons
//
//
// // In likes_controller
// - Change create, destroy paths to remove redirects and return JSON objects

let arg;

function test(input) { console.log(input) }
$(document).ready(function() {
  // $(`.like-btn`).click(function() {
  //   console.log("I've been clicked")
  //   // $( this ).width(900);
  //   console.log(this)
  //
  //   console.log(this.parentNode.parentNode.id)
  //
  //   $(this)
  //     .parent()
  //     .parent()
  //     .find(".like-count")
  //     .html(`<%= @post.likes.count %> <%= (Post.find(9).likes.count) == 1 ? 'Like' : 'Likes'%>`);
  //
  // });

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
        console.log($(this).parent())
        console.log($(this))
        $(this).attr("action", `posts/${data.post_id}/likes/${data.user_like.id}`)
        // change url to be posts/posts_id/likes/likes_id
        // change method to delete
      }
      else {
        let likeCount = data.like_count
        likeCountEl.html(`${likeCount} Like${likeCount === 1 ? "" : "s"}`);
        likeIconEl.attr("src", "like.png");
        $(this).attr("action", `posts/${data.post_id}/likes`)
        // change url to be posts/posts_id/likes/
        // change method to delete
      }

  };

  })
