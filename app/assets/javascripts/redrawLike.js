function redrawLike(post) {
  $('#' + divId).load(url + ' #' + divId.replace("_wrapper", ""), function() {
    console.log('load mid');
    $('#' + divId.replace("_wrapper", "")).show();
    console.log('load complete');
  });
};
