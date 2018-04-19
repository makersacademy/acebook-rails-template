function redrawLikes(wrapperID, url, linkID) {
  console.log('function called')
  $('#' + linkID).ajaxSuccess(redraw(wrapperID, url));
  function redraw(wrapperID, url) {
    setTimeout(function(){
      console.log('callback called')
      $('#' + wrapperID).load(url + ' #' + wrapperID);
    }, 100);
  };
};
