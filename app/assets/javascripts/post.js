$(document).ready(function() {
  $( "[id^=post_edit]" ).click(function() {
    // get id from div above
    var post_id = this.id.split("_");
    var post_div_id = "#post_text_" + post_id[2];
    var post_edit_url = "/posts/" + post_id[2] + "/edit"
    //update modal form to new path and prepopulate wih exisiting value
    $("#editForm").attr("action",post_edit_url)
    $(".form-control").val($(post_div_id).text())

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
