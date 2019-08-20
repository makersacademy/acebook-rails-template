import React, { Component } from 'react';
import axios from 'axios';
import PropTypes from 'prop-types';
// import PostItem from './components/PostItem.js';

export class Posts extends Component {
  state = {
    posts: []
  }

  componentDidMount() {
    axios.get('https://mugmanual.herokuapp.com/post_api')
    .then(res => this.setState({ posts: res.data }))

 }

 render() {
   return {
     <h1>hi guys</h1>
   };
 }
}

Posts.propTypes = {
posts: PropTypes.array.isRequired
}

export default Posts



 // this.state.posts.map((post) => {
