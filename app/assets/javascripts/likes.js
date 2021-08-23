document.addEventListener('DOMContentLoaded', (event) => {
  const posts = document.querySelectorAll('.post');
  posts.forEach((post) => {
    post.querySelector('.like-button').addEventListener('click', (e) => {
      testing = post.querySelector(".button_to")
      token = testing.querySelector("input[name=authenticity_token").value; 
      e.preventDefault();
      fetch(`posts/${post.id}/likes`, {
        method: 'POST',
        credentials: 'same-origin',
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': token
        },
      })
      .then(response => response.text())
      .then(text => {
        const parser = new DOMParser();
        const htmlDocument = parser.parseFromString(text, "text/html");
        const updatedLike = htmlDocument.documentElement.querySelector(".likes").innerHTML;
        post.querySelector('.likes').innerHTML = updatedLike;
      })
      });
    });
  });
