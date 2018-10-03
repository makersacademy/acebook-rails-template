import React, { Component } from "react";

class SignUp extends Component {
  constructor(props) {
    super(props);
    this.state = {
      first_name: "",
      surname: "",
      email: "",
      password: ""
    };
    this.handleInputChange = this.handleInputChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInputChange(event) {
    const target = event.target;
    this.setState({
      [target.name]: target.value
    });
  }

  handleSubmit(event) {
    const url = "http://localhost:3000/api/v1/users";
    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        user: { email: this.state.email, password: this.state.password }
      })
    }).then(res => console.log(res));
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          First Name
          <br />
          <input
            type="text"
            name="first_name"
            value={this.state.first_name}
            onChange={this.handleInputChange}
          />
        </label>
        <label>
          Surname
          <br />
          <input
            type="text"
            name="surname"
            value={this.state.surname}
            onChange={this.handleInputChange}
          />
        </label>
        <label>
          Email
          <br />
          <input
            type="email"
            name="email"
            value={this.state.email}
            onChange={this.handleInputChange}
          />
        </label>
        <label>
          Password
          <br />
          <input
            type="password"
            name="password"
            value={this.state.password}
            onChange={this.handleInputChange}
          />
        </label>
        <input type="submit" value="Sign Up" />
      </form>
    );
  }
}

export default SignUp;
