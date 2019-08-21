import React, { Component } from 'react';
import axios from 'axios';
import PropTypes from 'prop-types';
import PostItem from './PostItem.js';

export class Posts extends Component {
  state = {
    posts: [],
    users: []
  }

  componentDidMount() {
    axios.get('https://mugmanual.herokuapp.com/post_api')
    .then(res => this.setState({ users: res.data[0].user}))
  }

  componentDidMount() {
    axios.get('https://mugmanual.herokuapp.com/post_api')
    .then(res => this.setState({ posts: res.data[0].post}))
  }

  render() {
    return this.state.posts.map((post) => (
      <PostItem key={post.id} post={post}/>
    ));
  }
}

// Posts.propTypes = {
// posts: PropTypes.array.isRequired
// }

export default Posts

 // this.state.posts.map((post) => {
  // <PostItem key={post.id} post={post}/>
