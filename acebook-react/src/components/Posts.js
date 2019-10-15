import React, { Component } from 'react'
class Posts extends React.Component {
  constructor() {
    super();
    this.state = {
      posts: null,
    }
  }

  componentDidMount() {
    fetch('http://localhost:3000/api/v1/posts/', {
      method: 'GET',
    }
    ).then(response => response.json())
      .then(data => this.setState({ posts: data }))
  }

  render() {
    const { posts } = this.state;
    //     const items = this.state.cart.map((item, key) =>
    //     <li key={item.id}>{item.name}</li>
    // );

    console.log(posts)
    if (!posts) {
      return (
        <div>pending</div>
      );
    } else {
      return (
        <form>
          <label htmlFor="hello">Hello World</label>
          <div>{posts[0].id}{posts[0].message}</div>
          <div>{posts[1].id}{posts[1].message}</div>
        </form>
      );
    }
  }
}
export default Posts;