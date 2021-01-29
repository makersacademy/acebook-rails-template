import React from "react"
import AllPosts from "./AllPosts.js"
import NewPost from "./NewPost"
import PropTypes from "prop-types"
class MyComponent extends React.Component {
  render () {
    return (
      <React.Fragment>
        <NewPost />
        <AllPosts posts={this.props.data}/>
      </React.Fragment>
    );
  }
}

export default MyComponent