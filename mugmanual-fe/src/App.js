import React, { Component } from 'react';
import Posts from './components/Posts';
import AddPost from './components/AddPost';
import axios from 'axios';

class App extends Component {
  state = {
    posts: []
  };

  componentDidMount() {
    axios.get('https://mugmanual.herokuapp.com/post_api')
    .then(res => this.setState({ posts: res.data}))
    console.log(this.state.posts)
  }

  // Delete Post
  delTodo = (id) => {
    this.setState({ posts: [...this.state.posts.filter(post => post.id !== id)]});
  }

  // Add Post
  addPost = (message) => {
    const newTodo ={
      id: 4,
      message,
    }
    this.setState({ posts: [...this.state.posts, newTodo] });
  }

  render() {
    // console.log(this.state.posts) 
    return (
      <div>
        <AddPost addPost={this.addPost} />
        <Posts 
        posts={this.state.posts}
        delPost={this.delTodo}/>
      </div>
    );
  };
}

export default App;
