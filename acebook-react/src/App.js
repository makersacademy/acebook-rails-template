import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import React from 'react';
import './App.css';
import Home from './components/Home';
import Login from './components/Login';
import Register from './components/Register';
import Posts from './components/Posts';
import Header from './components/layout/Header'
import 'bootstrap/dist/css/bootstrap.min.css';

class App extends React.Component {
  render(){

    return (
      <div className="App">
        <Router>
        <Header />
       <Switch>
          <Route exact path="/" component={Home} />
          <Route exact path="/login" component={Login} />
          <Route exact path="/register" component={Register} />
          <Route exact path="/posts" component={Posts} />
        </Switch>
        </Router>
      </div>
  )};
}

export default App;
