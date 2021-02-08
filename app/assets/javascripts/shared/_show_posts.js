$(document).ready(function(){

  $(document).on('mouseenter', '.post', function(){
    $(this).css("border", "solid 3px black");
  });

  $(document).on('mouseleave', '.post', function(){
    $(this).css("border", "solid 1px gainsboro");
  });
  
});