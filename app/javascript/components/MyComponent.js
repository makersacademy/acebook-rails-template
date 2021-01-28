import React from "react"
import AllPosts from "./AllPosts.js"
import PropTypes from "prop-types"
class MyComponent extends React.Component {
  render () {
    return (
      <React.Fragment>
        <AllPosts />
      </React.Fragment>
    );
  }
}

export default MyComponent