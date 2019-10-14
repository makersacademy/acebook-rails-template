import React, { Component } from 'react'

class Register extends React.Component {
  constructor() {
    super();
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  handleSubmit(event) {
    event.preventDefault();
    const data = new FormData(event.target);
    fetch('http://localhost:3000/api/v1/users/new', {
      method: 'POST',
      body: data,
    }
    ).then(response => response.json()).then(data => console.log(data));
  }
  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label htmlFor="email">Enter your email</label>
        <input id="email" name="email" type="email" />
          <label htmlFor="email">Enter your password</label>
          <input id="password" name="password" type="password" />
        <button>Login</button>
         
      </form>
    );
  }
 }
 export default Register;
