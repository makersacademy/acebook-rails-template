import React, { Component } from 'react'
import { Redirect } from 'react-router-dom';

class Login extends React.Component {
  constructor() {
    super();
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  state = {
    redirect: false
  }

  setRedirect = () => {
    this.setState({
      redirect: true
    })
  }

  renderRedirect = () => {
    if (this.state.redirect) {
      return <Redirect to='/home' />
    }
  }

  handleSubmit(event) {
    event.preventDefault();
    const data = new FormData(event.target);
    fetch('http://localhost:3000/api/v1/users', {
      method: 'POST',
      body: data,
    })
    .then(response => response.json()).then(data => {
      this.setRedirect()
      this.renderRedirect()
    }).catch(error => {
        document.getElementById("Error").innerHTML = "Password or Email Invalid"
    });
  }

  render() {
    return (
      <div>
      <form onSubmit={this.handleSubmit}>
        <label htmlFor="email">Enter your email</label>
        <input id="email" name="email" type="email" />
        <label htmlFor="email">Enter your password</label>
        <input id="password" name="password" type="password" />
        {this.renderRedirect()}
        <button>Login</button>

      </form>
      <p id="Error"></p>
      </div>
    );
  }
}

export default Login;
