import React from 'react';
import ReactDOM from 'react-dom';

class TestClass extends React.Component {
  render() {
    return <h1>Hello world</h1>;
  }
}

ReactDOM.render(
	<MyComponentClass />, 
	document.getElementById('test')
);