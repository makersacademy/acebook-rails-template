document.addEventListener('DOMContentLoaded', () => {
  let posts = document.getElementsByClassName('post-box');

  [...posts].map((post) => {
    let comments = post.getElementsByClassName('commentsDiv');
    let allComments = [...comments];
    let section = post.getElementsByClassName('commentSection');
    let commentSection = section[0];
    let displayButton = document.createElement('button');
    displayButton.innerHTML = 'More';
    let show = true;

    displayButton.addEventListener('click', () => {
      if (show) {
        commentSection.innerHTML = '';
        allComments.forEach((each) => {
          commentSection.appendChild(each);
        });
        displayButton.innerHTML = 'Less';
        commentSection.appendChild(displayButton);
      } else {
        commentSection.innerHTML = `${allComments[0].innerHTML}</br> ${allComments[1].innerHTML} </br>`;
        displayButton.innerHTML = 'More';
        commentSection.appendChild(displayButton);
      }
      show = !show;
    });

    if (comments.length > 2) {
      commentSection.innerHTML = `${comments[0].innerHTML}</br> ${comments[1].innerHTML} </br>`;
      commentSection.appendChild(displayButton);
    }
  });
});
