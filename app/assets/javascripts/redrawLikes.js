function redrawLikes(divID, url) {
  $('#' + divID).load(url + ' #' + divID.replace("_wrapper", ""));
};
