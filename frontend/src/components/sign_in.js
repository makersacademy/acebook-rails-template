import React, { Component } from 'react'

class SignIn extends Component {
  constructor(props){
    super(props)
    this.state = {
      email: '',
      password: ''
    }
    this.handleInputChange = this.handleInputChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleInputChange(event){
    const target = event.target
    this.setState({
      [target.name]: target.value
    })
  }

  handleSubmit(event){
    const url = 'localhost:2000/api/v1/sessions'
    fetch(url, {
      method: 'POST',
      body: { 
        "email": this.state.email, 
        "password": this.state.password
      }
    })
    .then( res => res.json)
    .then( result => console.log(result))
    event.preventDefault()
  }



  render(){
    return(
      <form onSubmit={this.handleSubmit}>
        <br/>
        <label>
          Email:
          <br/>
          <input type="text" name="email" value={this.state.email} onChange={this.handleInputChange} />
        </label>
        <label>
          Password:
          <br/>
          <input type="password" name="password" value={this.state.password} onChange={this.handleInputChange} />
        </label>
        <input type="submit" value="Submit"/>
      </form>
    )
  }
}

export default SignIn