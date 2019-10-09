// Place all the behaviors and hooks related to postcontroller here.

function editPost(postID, postMessage){
  var postElement = document.getElementById(postID);
  returnHTML = "<textarea>" + postMessage + "</textarea>"
             + "<button>Save</button>"
  postElement.innerHTML = returnHTML;
}
