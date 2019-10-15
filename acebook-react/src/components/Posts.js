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
  render() {
    const {posts} = this.state;

      console.log(posts)
      return (
        <ul>
         {posts.map(post => (
           <li key={post.id}>
             {post.message}
           </li>
         ))}
       </ul>
      );
  }
 }
 export default Posts;
