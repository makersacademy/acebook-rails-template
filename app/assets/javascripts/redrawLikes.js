function redrawLikes(wrapperID, url, linkID) {
  $('#' + linkID).ajaxSuccess(redraw(wrapperID, url));
  function redraw(wrapperID, url) {
    setTimeout(function(){
      $('#' + wrapperID).load(url + ' #' + wrapperID);
    }, 100);
  };
};
