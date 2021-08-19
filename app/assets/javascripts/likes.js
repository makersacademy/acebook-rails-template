document.addEventListener('DOMContentLoaded', (event) => {
  console.log('DOM fully loaded and parsed');
  const button = document.querySelectorAll('.button_to')  
  for ( let i  = 0; i < button.length; i++) {
    button[i].addEventListener('click', (e) => { 
      e.preventDefault();
     let id = button[i][0].id;
     let likes = document.getElementById(`likes${id}`);
      $.ajax ({ 
        url: `posts/${id}/likes`,
        type: 'POST',
        success: function (response) {
          let like = $($.parseHTML(response)).filter('p')[i];
          likes.innerHTML = like.innerHTML;
       }
      });
      
    });
  }
});
