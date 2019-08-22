$(document).ready(function() {

  $('.edit-post-inline-link').click((e) => {
    const user_id = e.target.dataset.userId
    const session_id = e.target.dataset.sessionId
    const postTime = Date.parse(e.target.dataset.createdTime)
    const currentTime = Date.parse(new Date())

    if (user_id !== session_id) {
      $("#pop_up_wrong_user").addClass("active")
      $('#pop_up_wrong_user').click((e) => {
        $("#pop_up_wrong_user").removeClass("active")
      })
    } else if (currentTime - postTime >= 600000) {
      $("#pop_up_too_slow_motherfucker").addClass("active")
      $('#pop_up_too_slow_motherfucker').click((e) => {
        $("#pop_up_too_slow_motherfucker").removeClass("active")
      })
    }
    else {
      e.preventDefault()
      const postId = e.target.dataset.postId;
      $(".post-text").hide();
      $(`#edit-post-inline-${postId}`).fadeIn()
    }
  })

  $('.edit-comment-inline-link').click((e) => {
    const user_id = e.target.dataset.userId
    const session_id = e.target.dataset.sessionId

    if (user_id !== session_id) {
      $("#pop_up_wrong_user").addClass("active")
      $('#pop_up_wrong_user').click((e) => {
        $("#pop_up_wrong_user").removeClass("active")
      })
    }
    else {
      e.preventDefault()
      const commentId = e.target.dataset.commentId
      $(`#comment-text-${commentId}`).hide()
      $(`#edit-comment-inline-${commentId}`).show()
    }
  })

  $('.delete-post').click((e) => {
    const user_id = e.target.dataset.userId
    const session_id = e.target.dataset.sessionId

    if (user_id !== session_id) {
      $("#pop_up_cant_delete").addClass("active")
      $('#pop_up_cant_delete').click((e) => {
      $("#pop_up_cant_delete").removeClass("active")
      })
    } else {
      e.preventDefault()
      const postId = e.target.dataset.postId
      $(`#post-text-${postId}`).hide()
      $(`#delete-confirmation-${postId}`).show()
    }
  })

  $('.comment-title').click((e) => {
    console.log(e.target.dataset.listId)
    const list_id = e.target.dataset.listId
    e.preventDefault()
    $('#comment-list-' + list_id).slideToggle()

  })

})
