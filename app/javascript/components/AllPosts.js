import React from "react"

class AllPosts extends React.Component {
  render(){
    return(
      <div>
        <h1>All posts:
        <ul>
          {this.props.posts.map((post) => <li>{post.message} {post.created_at}</li>)}
        </ul>
      
        </h1>
      </div>
      )
    }
  }

export default AllPosts

  