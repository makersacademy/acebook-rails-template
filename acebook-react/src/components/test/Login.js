import React, { Component } from 'react'
class Test extends Component {
 state = {
   id: ''
 }
 componentDidMount() {
   fetch(`http://localhost:3000/api/v1/users/rafa@rafa`)
     .then(response => response.json())
     .then(data => this.setState({
       id: data.id
     }))
 }
 render() {
   const { id } = this.state;
   return (
     <div>
       <h1>{id}</h1>
     </div>
   )
 }
}
export default Test;
