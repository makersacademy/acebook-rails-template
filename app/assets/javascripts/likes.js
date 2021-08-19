document.addEventListener('DOMContentLoaded', (event) => {
  console.log('DOM fully loaded and parsed');
  const buttons = document.querySelectorAll('.like-button') 
  for ( let i  = 0; i < buttons.length; i++) {
    buttons[i].addEventListener('click', (e) => { 
      e.preventDefault();
      let id = buttons[i].id;
      let likesContainer = document.getElementById(`likes-for-post${id}`);
      $.ajax ({ 
        url: `posts/${id}/likes`,
        type: 'POST',
        success: function (response) {
          const post = $($.parseHTML(response)).filter('div.post')[i];
          let updatedLike = post.querySelector(`.likes`).innerHTML;
          likesContainer.innerHTML = updatedLike;
       }
      });
    });
  }
});
