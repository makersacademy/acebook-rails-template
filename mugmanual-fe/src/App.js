import React, { Component } from 'react';
import Header from './components/layout/Header'
import Posts from './components/Posts';
import AddPost from './components/AddPost';
import './App.css';
import axios from 'axios';

class App extends Component {
  state = {
    posts: []
  };

  componentDidMount() {
    axios.get('https://mugmanual.herokuapp.com/post_api')
    .then(res => this.setState({ posts: res.data}))
  }

  // Delete Post
  delPost = (id) => {
    this.setState({ posts: [...this.state.posts.filter(post => post.id !== id)]});
  }

  // Add Post
  addPost = (message) => {
    axios.post('https://mugmanual.herokuapp.com/posts', {
      message
    })
    .then(res => this.setState({ posts: [...this.state.posts, res.data] }));
  }

  render() {
    // console.log(this.state.posts)
    return (
      <div>
        <Header />
        <AddPost addPost={this.addPost} />
        <Posts
        posts={this.state.posts}
        delPost={this.delPost}/>
      </div>
    );
  };
}

export default App;
