$( document ).ready(function() {

  var collapsibleDivs = document.getElementsByClassName('collapsible');
  var i;

  for (i = 0; i < collapsibleDivs.length; i++) {
   collapsibleDivs[i].addEventListener('click', collapseOrExpand)
  };

  function collapseOrExpand() {
    this.classList.toggle('active');
    var content = this.nextElementSibling;
    if (content.style.display === 'block') {
      content.style.display = 'none';
    } else {
      content.style.display = 'block';
    }
  };
  
});
