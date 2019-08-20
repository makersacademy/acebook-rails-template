import React, { Component } from 'react';
import axios from 'axios';

export class Posts extends Component {
  state = {
    posts: []
  }

  componentDidMount() {
    axios.get('https://mugmanual.herokuapp.com/post_api')
    .then(res => this.setState({ posts: res.data }))
 }

 render() {
  return (
    <div>
      return this.state.posts.map((post) => {
        <PostItem key={post.id} post={post} />
      })
    </div>
  )
}
  }

// componentDidMount() {
//   fetch("https://mugmanual.herokuapp.com/post_api")
//     .then(res => res.json())
//     .then(
//       (result) => {
//         this.setState({
//           isLoaded: true,
//           items: result.items
//         });
//       },
//       // Note: it's important to handle errors here
//       // instead of a catch() block so that we don't swallow
//       // exceptions from actual bugs in components.
//       (error) => {
//         this.setState({
//           isLoaded: true,
//           error
//         });
//       }
//     )
//   }

// render() {
//   const { error, isLoaded, items } = this.state;
//   if (error) {
//     return <div>Error: {error.message}</div>;
//   } else if (!isLoaded) {
//     return <div>Loading...</div>;
//   } else {
//     return (
//       <ul>
//         {items.map(item => (
//           <li key={item.message}>
//           </li>
//         ))}
//       </ul>
//     );
//   }
// }
// }

export default Posts
