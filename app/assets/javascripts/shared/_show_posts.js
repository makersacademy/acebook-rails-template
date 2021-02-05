$(document).ready(function(){
  
  $(".post").hover(function(){
    $(this).css("border", "solid 3px black");
    }, function(){
    $(this).css("border", "solid 1px gainsboro");
  });
  
});