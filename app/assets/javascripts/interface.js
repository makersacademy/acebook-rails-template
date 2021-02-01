console.log("I'm in the interface")

fetch('/posts_api')
  .then(response => response.json())
  .then(data => {
    
    let divPosts = document.getElementById("posts")
    divPosts.innerHTML = ''
    data.forEach(element => {

        let div = document.createElement('div')
        div.setAttribute('id', 'post')
        let user = `<p>${element.user_id}</p><br>`
        let message = `<p>${element.message}</p><br>`
        let time = `<p>${element.created_at}</p><br>`
        div.innerHTML = user + message + time
        divPosts.appendChild(div)
    });
  });

// class LikeButton extends React.component {
//     constructor(props) {
//         super(props);
//     }
// }

//   const e = React.createElement;
  
//   class LikeButton extends React.Component {
//     constructor(props) {
//       super(props);
//       this.state = { liked: false };
//     }
  
//     render() {
//       if (this.state.liked) {
//         return 'You liked this.';
//       }
  
//       return e(
//         'button',
//         { onClick: () => this.setState({ liked: true }) },
//         'Like'
//       );
//     }
//   }