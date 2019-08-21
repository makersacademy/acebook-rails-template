import React, { Component } from 'react'
import Button from 'react-bootstrap/Button';
import ButtonToolbar from 'react-bootstrap/ButtonToolbar';
import Form from 'react-bootstrap/Form';

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
      <Form.Group controlId="exampleForm.ControlTextarea1">
        <Form.Control as="textarea" rows="3" type="text" 
          name="message"
          placeholder="What's on your mind..."
          onSubmit={this.onSubmit}
          value={this.state.message}
          onChange={this.onChange} />
          <ButtonToolbar>
          <Button variant="primary" size="sm">
          Post
          </Button>
          </ButtonToolbar>
          </Form.Group>
    )
  }
}

export default AddPost
