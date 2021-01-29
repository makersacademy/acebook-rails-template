import React from "react"
import AllPosts from "./AllPosts.js"
import NewPost from "./NewPost"
import PropTypes from "prop-types"
class MyComponent extends React.Component {

  constructor(props) {
    super(props);
    this.rerenderAllPostsCallback = this.rerenderAllPostsCallback.bind(this);
    this.collectData = this.collectData.bind(this);
    this.state = { data: this.props.data }
  }


  rerenderAllPostsCallback() {

      this.collectData();
  }

  collectData() {
    fetch('http://localhost:3000/posts/data', {
        method: 'GET',
      }).then((response) => {
        this.setState({ data: response.json() })
      }).then(() => {
        this.forceUpdate();
      })
  }

  render () {
    console.log(this.state)
    return (
      <React.Fragment>
        <NewPost rerenderAllPostsCallback={this.rerenderAllPostsCallback}/>
        <AllPosts posts={this.state.data}/>
      </React.Fragment>
    );
  }
}

export default MyComponent