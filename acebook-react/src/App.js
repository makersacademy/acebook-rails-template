import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import React from 'react';
import logo from './logo.svg';
import './App.css';
import Test from './components/test/Test';


class App extends React.Component {
  render(){

    return (
      <div className="App">
        <Router>
       <Switch>
          <Route exact path="/" component={Test} />
        </Switch>
        </Router>
      </div>
  )};
}

export default App;
