$(document).ready(function() {
  $('.header').height($(window).height());

  $('.edit-post-inline-link').click((e) => {
    const user_id = e.target.dataset.userId
    const session_id = e.target.dataset.sessionId
    const postTime = Date.parse(e.target.dataset.createdTime)
    const currentTime = Date.parse(new Date())
    console.log(postTime)
    console.log(currentTime)
    console.log(currentTime - postTime)
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
      const postId = e.target.dataset.postId
      $(`#post-text-${postId}`).hide()
      $(`#edit-post-inline-${postId}`).show()
    }
  })

})
