$(document).ready(function() {
  $( "[id^=post_edit]" ).click(function() {

    // get id from div above
    let post_id = this.id.split("_");
    let post_edit_url = "/posts/" + post_id[2]
    //update modal form to new path
  $("#editForm").attr("action",post_edit_url)

   });

     document.addEventListener('keydown', function(e) {
       if (e.keyIdentifier == 'U+000A' || e.keyIdentifier == 'Enter' || e.keyCode == 13) {
         if (e.target.nodeName == 'INPUT' && e.target.type == 'text') {
           e.preventDefault();
           return false;
         }
       }
     }, true);
});
