$(document).ready(function() {
  $('.header').height($(window).height());

  $('.edit-post-inline-link').click((e) => {
    e.preventDefault()
    const postId = e.target.dataset.postId
    $(`#post-text-${postId}`).hide()
    $(`#edit-post-inline-${postId}`).show()
  })
})
