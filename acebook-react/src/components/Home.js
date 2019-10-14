import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class Login extends React.Component {
  render() {
    return (
      <div>
        <Link to="/register">Register</Link><br />
        <Link to="/login">Login</Link>
      </div>
    );
  }
 }
 export default Login;
