import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class Login extends React.Component {
  render() {
    if (!localStorage.getItem('user')) {
      return (
        <div>
          <Link to="/register">Register</Link><br />
          <Link to="/login">Login</Link>
        </div>
      );
    } else {
      return (
        <p>You are logged in</p>
      )
    }
  }
}
export default Login;
