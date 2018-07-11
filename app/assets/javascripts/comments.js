// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function checkIfTextTooLong(commentForm){
  commentTextLength = commentForm.childNodes[5].value.length

  if (commentTextLength > 140 ) {
    alert('Comment too short!');
    return false;
  }
}
