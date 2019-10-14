import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import React from 'react';
import logo from './logo.svg';
import './App.css';
import Test from './components/test/Test';
import Login from './components/test/Login';



class App extends React.Component {
  render(){

    return (
      <div className="App">
        <Router>
       <Switch>
          <Route exact path="/" component={Test} />
          <Route exact path="/login" component={Login} />
        </Switch>
        </Router>
      </div>
  )};
}

export default App;
