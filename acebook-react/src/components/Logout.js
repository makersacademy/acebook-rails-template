import React, { Component } from 'react'
import { Redirect } from 'react-router-dom';

class Logout extends React.Component {
  constructor() {
    super();
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  state = {
    redirect: false,
    error: ''
  }

  setRedirect = () => {
    this.setState({
      redirect: true
    })
  }

  renderRedirect = () => {
    if (this.state.redirect) {
      return <Redirect to='/' />
    }
  }

  handleSubmit(event) {
    event.preventDefault();
    localStorage.clear()
    this.setRedirect()
  }

  render() {
    return (
      <div>
        <form onSubmit={this.handleSubmit}>

          {this.renderRedirect()}
          <button>Logout</button>

        </form>
      </div>
    );
  }
}

export default Logout;