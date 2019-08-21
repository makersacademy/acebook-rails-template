import React, { Component } from 'react'
import PropTypes from 'prop-types';

export class PostItem extends Component {
  render() {
    const { id, username, message, created_at } = this.props.post;
    return (
      <div>
        <p>
        { username }:
        { message } -
        { created_at }
        <button onClick={this.props.delPost.bind(this, id)}> delete </button>
        </p>
      </div>
    )
  }
}

// PropTypes
PostItem.propTypes = {
  post: PropTypes.object.isRequired
}

export default PostItem;
