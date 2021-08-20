document.addEventListener('DOMContentLoaded', (event) => {
  console.log('DOM fully loaded and parsed');
  // const buttons = document.querySelectorAll('.like-button')
  const posts = document.querySelectorAll('.post');
  console.log(posts);
  posts.forEach((post) => {
    post.querySelector('.like-button').addEventListener('click', (e) => {
      testing = post.querySelector(".button_to")
      token = testing.querySelector("input[name=authenticity_token").value; 
      e.preventDefault();
      console.log(post.querySelector('.likes'));
      let likesContainer = post.querySelector('.likes');
      // $.ajax ({ 
      //   url: `posts/${post.id}/likes`,
      //   type: 'POST',
      //   success: function (response) {
      //     const newPost = $($.parseHTML(response)).filter(`div#${post.id}`)[0];
      //     console.log(newPost);
      //     let updatedLike = newPost.querySelector(`.likes`).innerHTML;
      //     post.querySelector('.likes').innerHTML = updatedLike;
      //  }
      // });
      fetch(`posts/${post.id}/likes`, {
        method: 'POST',
        credentials: 'same-origin',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': token
        },
      })
      .then(response => console.log(response.text()))
      });
    });
  });

