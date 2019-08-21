import React, { Component } from 'react'
import Button from 'react-bootstrap/Button';
import ButtonToolbar from 'react-bootstrap/ButtonToolbar';
import Card from 'react-bootstrap/Card';
import PropTypes from 'prop-types';

export class PostItem extends Component {
  render() {
    const { id, username, message, created_at } = this.props.post;
    return (
      <div>
        <center><Card style={{ width: '18rem' }}>
        <Card.Body>
          <Card.Title>{username}</Card.Title>
          <Card.Subtitle className="mb-2 text-muted">{created_at}</Card.Subtitle>
          <Card.Text>
            {message}
          </Card.Text>
          <ButtonToolbar>
          <Button variant="primary" size="sm" onClick={this.props.delPost.bind(this, id)}>
          Delete
          </Button>
          </ButtonToolbar>
          </Card.Body>
        </Card></center><br></br>
      </div>
    )
  }
}

// PropTypes
PostItem.propTypes = {
  post: PropTypes.object.isRequired
}

export default PostItem;
