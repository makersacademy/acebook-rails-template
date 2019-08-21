import React, { Component } from 'react'

export class AddPost extends Component {
  state = {
    message: ''
  }

  onSubmit = (e) => {
    e.preventDefault();
    this.props.addPost(this.state.message);
    this.setState({ message: '' });
  }

  onChange = (e) => this.setState({ [e.target.name]: e.target.value });

  render() {
    return (
      <form onSubmit={this.onSubmit}>
        <input 
          type="text" 
          name="message"
          placeholder="Add Post ..."
          value={this.state.message}
          onChange={this.onChange}
        />
        <input 
          type="submit" 
          value="Submit" 
        />
      </form>
    )
  }
}

export default AddPost
