document.addEventListener('DOMContentLoaded', (event) => {
  console.log('DOM fully loaded and parsed');
  const buttons = document.querySelectorAll('.like-button') 
  for ( let i  = 0; i < buttons.length; i++) {
    buttons[i].addEventListener('click', (e) => { 
      e.preventDefault();
     let id = buttons[i].id;
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
