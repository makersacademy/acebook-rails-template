document.addEventListener('DOMContentLoaded', (event) => {
  console.log('DOM fully loaded and parsed');
  // const buttons = document.querySelectorAll('.like-button')
  const posts = document.querySelectorAll('.post');
  console.log(posts);
  posts.forEach((post) => {
    post.querySelector('.like-button').addEventListener('click', (e) => {
      console.log('listening'); 
      e.preventDefault();
      console.log(post.querySelector('.likes'));
      let likesContainer = post.querySelector('.likes');
      console.log(likesContainer);
      $.ajax ({ 
        url: `posts/${post.id}/likes`,
        type: 'POST',
        success: function (response) {
          const newPost = $($.parseHTML(response)).filter(`div#${post.id}`)[0];
          console.log(newPost);
          let updatedLike = newPost.querySelector(`.likes`).innerHTML;
          post.querySelector('.likes').innerHTML = updatedLike;
       }
      });
    });
  });
});
