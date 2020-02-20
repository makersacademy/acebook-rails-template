// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

window.addEventListener('load', function() {
  id_audio = document.querySelector('#identification')
  chewy_audio = document.querySelector('#chewbaccaPlay')
  id_audio.currentTime = 0;
  id_audio.play()
  clickHandler = function(event) {
    event.preventDefault()
    self = this
    chewy_audio.addEventListener('ended', function() {
      self.removeEventListener('click', clickHandler)
      self.click()
    })
    chewy_audio.currentTime = 0;
    chewy_audio.play()
  }
  document.querySelector('#submitBtn').addEventListener('click', clickHandler)
});
