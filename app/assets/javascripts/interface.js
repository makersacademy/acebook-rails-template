
function renderPosts() {
    fetch('/posts_api')
      .then(response => response.json())
      .then(data => {

        let divPosts = document.getElementById("posts")
        divPosts.innerHTML = ''
        data.forEach(element => {
            let div = document.createElement('div')
            div.setAttribute('id', 'post')
            let user = `<p>${element.user_name}</p><br>`
            let message = `<p>${element.message}</p><br>`
            let time = `<p>${element.created_at}</p><br>`
            let likes = `<p>${element.number_of_likes}</p><br>`
            let like_button = document.createElement('div')
            div.innerHTML = user + message + time + likes
            ReactDOM.render(e(LikeButton, {post_id: element.id}),  like_button);
            div.appendChild(like_button)
            divPosts.appendChild(div)
        });
      });
    };

renderPosts()

  const e = React.createElement;

  class NumberOfLikes extends React.Component {

  }
  
  class LikeButton extends React.Component {
    constructor(props) {
      super(props);
      this.state = { 
        loading: true,
        liked: false, 
      };
      this.handleClick = this.handleClick.bind('this');
      this.fetchLikeData()     
    }

    fetchLikeData() {
      const csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content");
      fetch("/likes/data", {
        method: "POST", 
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': csrf
        },
        body: JSON.stringify({ post_id: this.props.post_id })
      })
      .then(response => {
        return response.json();
      })
      .then(data => {
        this.setState(data)
      })
    }
    handleClick = () => {
      this.setState(prevState => (prevState, { 
        liked: !prevState.liked 
      }));
      this.sendLikeData() 
    }
  
    render() {
      if (this.state.loading) {
        return ''
      } 
      return e(
          'button',
          { onClick: () =>  this.handleClick() },
          this.state.liked ? 'Unlike' : 'Like'
          );
      }



    sendLikeData() {
      if (this.state.liked) {
        const csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content");
        fetch("/likes/destroy", {
          method: "POST", 
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': csrf
          },
          body: JSON.stringify({ post_id: this.props.post_id})
        })
        .then(response => {
        renderPosts()
      })
    } else {
        const csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content");
        fetch("/likes/create", {
          method: "POST", 
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': csrf
          },
          body: JSON.stringify({ post_id: this.props.post_id})
        })
        .then(response => {
        renderPosts()
      })
    }
  }

}

