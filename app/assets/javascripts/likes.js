document.addEventListener('DOMContentLoaded', (event) => {
  console.log('DOM fully loaded and parsed');
  const button = document.querySelectorAll('.like-button') 
  for ( let i  = 0; i < button.length; i++) {
    button[i].addEventListener('click', (e) => { 
      e.preventDefault();
     let id = button[i].id;
     let likesContainer = document.getElementById(`likes${id}`);
      $.ajax ({ 
        url: `posts/${id}/likes`,
        type: 'POST',
        success: function (response) {
          let updatedLike = $($.parseHTML(response)).filter('p')[i];
          likesContainer.innerHTML = updatedLike.innerHTML;
       }
      });
      
    });
  }
});
