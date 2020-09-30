document.addEventListener('DOMContentLoaded', () => {
  let posts = document.getElementsByClassName('post-box');

  [...posts].map((post) => {
    let comments = post.getElementsByClassName('commentsDiv');
    let saved = [...comments];
    let section = post.getElementsByClassName('commentSection');

    let button = document.createElement('button');
    button.innerHTML = 'More';

    let show = true;

    button.addEventListener('click', () => {
      if (show) {
        section[0].innerHTML = '';
        saved.forEach((comm) => {
          section[0].appendChild(comm);
        });
        section[0].appendChild(button);
      }

      show = !show;
    });

    if (comments.length > 2) {
      section[0].innerHTML = `${comments[0].innerHTML}</br> ${comments[1].innerHTML} </br>`;
      section[0].appendChild(button);
    }
  });
});
