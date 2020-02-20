// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

onLoad = function() {
  audio = document.querySelector('#not_found_audio')
  audio.addEventListener('ended', function() {
    window.location.href = "/"
  })
  audio.currentTime = 0
  audio.play()
}

window.addEventListener('load', onLoad);
