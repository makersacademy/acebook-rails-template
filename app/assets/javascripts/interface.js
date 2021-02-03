console.log("I'm in the interface")
let likes = 0
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
      this.handleClick = this.handleClick.bind('this');
      
    }

    handleClick = () => {
      this.setState(prevState => (prevState, { 
        liked: !prevState.liked 
      }));
      this.sendLikeData() 
      console.log(likes)
    }
  
    render() {
        return e(
            'button',
            { onClick: () =>  this.handleClick() },
            this.state.liked ? 'Dislike' : 'Like'
          );
      }

    sendLikeData() {
      this.state.liked ? likes-- : likes++;

      fetch("/posts", {
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        method: "POST",
        body: JSON.stringify({message: "hello from message", user_id: 2})})
      .then(response => {
      console.log(response);
      console.log(response.json());
      console.log(JSON.stringify(response));
      })
    
  }

}