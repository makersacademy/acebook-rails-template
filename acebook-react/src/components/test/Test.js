import React, { Component } from 'react'
class Test extends Component {
 state = {
   email: ''
 }
 componentDidMount() {
   fetch(`http://localhost:3000/api/v1/users/`)
     .then(response => response.json())
     .then(data => this.setState({
       email: data[0].email
     }))
 }
 render() {
   const { email } = this.state;
   return (
     <div>
       <h1>{email}</h1>
     </div>
   )
 }
}
export default Test;
