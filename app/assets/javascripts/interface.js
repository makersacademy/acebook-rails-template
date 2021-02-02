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
        let like_button = document.createElement('div')
        div.innerHTML = user + message + time
        ReactDOM.render(e(LikeButton), like_button);
        div.appendChild(like_button)
        divPosts.appendChild(div)
    });
  });


  const e = React.createElement;
  
  class LikeButton extends React.Component {
    constructor(props) {
      super(props);
      this.state = { liked: false };
      this.setState = this.setState.bind('this');
    }
  
    render() {
        return e(
            'button',
            { onClick: () => this.setState(prevState => ({ liked: !prevState.liked }))},
            this.state.liked ? 'Dislike' : 'Like'
          );
      }
  }
  
