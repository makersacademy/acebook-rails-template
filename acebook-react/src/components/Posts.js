import React, { Component } from 'react'
class Posts extends React.Component {
  constructor() {
    super();
    this.state = {
    posts: []
    }
  }

  componentDidMount() {
    fetch('http://localhost:3000/api/v1/posts/', {
      method: 'GET',
    }
    ).then(response => response.json())
     .then(data => this.setState({
       isLoaded: true,
       posts: data}))
  }
  handleSubmit(event) {
    event.preventDefault();
    const data = new FormData(event.target);
    console.log(event);
    fetch('http://localhost:3000/api/v1/posts/', {
      method: 'DELETE',
      body: data,
    }
    ).then(response => response.json())
  }


  render() {
    const {posts} = this.state;
      console.log(posts)
      return (
        <div>
          <h1>Posts</h1>
          {posts.map(post => (
            <form key={post.id} onSubmit={this.handleSubmit}>
              {post.message}
              <input id="id" name="id" value={post.id} type="text" readOnly hidden/>
              <button>delete</button>
            </form>
          ))}
        </div>
      );
  }
 }
 export default Posts;
