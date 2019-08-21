import React, { Component } from 'react';
import PostItem from './PostItem';
import PropTypes from 'prop-types';

class Posts extends Component {
  render() {
    return this.props.posts.map((post) => (
      <PostItem 
      key={post.id} 
      post={post} 
      delPost={this.props.delPost}/>
    ));
  }
}

// PropTypes
Posts.propTypes = {
  posts: PropTypes.array.isRequired
}

export default Posts;
