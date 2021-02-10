$(document).ready(function(){

  $(document).on('mouseenter', '.post', function(){
    $(this).css("background", "#F0F6F6");
  });

  $(document).on('mouseleave', '.post', function(){
    $(this).css("background", "white");
  });

  $( document ).ready(function() {
    $(".post").has(".original-post").find(".profile-pic").css( "vertical-align", "top" );
  });
  
});