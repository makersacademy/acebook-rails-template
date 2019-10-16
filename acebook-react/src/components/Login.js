import React, { Component } from 'react'
import { Redirect } from 'react-router-dom';

class Login extends React.Component {
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
      return <Redirect to='/posts' />
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
        localStorage.setItem('user', data.email)
        this.setRedirect()
        this.renderRedirect()
      }).catch(error => {
        this.setState({ error: 'Invalid Email/Password' })
      });
  }

  render() {
    return (
      <div className="row">
      <div className="col-sm-4 offset-md-4 text-center">
        <div className="card border-0" style={{width: 350 + 'px'}}>
        <div className="card-body">

      <form onSubmit={this.handleSubmit}>
        <h1 className="display-6">
               Acebook
        </h1>

        <p className="display-6">
               Discover the new social media sensation 
               acebook - 
               developed by TEAM A.G.I.L
        </p>

        <br />
        <input id="email" name="email" type="email" placeholder="Email Address" style={{border: 0+ 'px', width: 300 + 'px'}}/><br/>
        <br />
        <input id="password" name="password" type="password" placeholder="Password" style={{border: 0+ 'px', width: 300 + 'px'}}/>
        <br/>
        <br />
        {this.renderRedirect()}
        <div className="text-center">
        <button className="btn btn-lg btn-primary btn-block" type="submit">Login</button>
        </div>
      </form>
      <p>{this.state.error}</p>
      </div>
      </div>
     </div>
     </div>
    );
  }
}

export default Login;
