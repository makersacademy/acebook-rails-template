import React, { Component } from "react";

class Timeline extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      feed: null
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  returnFeed() {
    if (this.state.feed === null) return "press button";
    const posts = this.state.feed.map(post => (
      <div className="timeline">
        <li className="posts">
          <h4>{post.user_id}</h4>
          <h5>{post.message}</h5>
        </li>
        <br />
      </div>
    ));
    return (
      <div>
        <ul className="centered">{posts}</ul>
      </div>
    );
  }

  handleSubmit(event) {
    const url = "http://localhost:2000/api/v1/posts";
    fetch(url, {
      method: "GET"
    })
      .then(res => res.json())
      .then(result => this.setState({ feed: result }));
    event.preventDefault();
  }

  render() {
    return (
      <React.Fragment>
        <div>
          <form onSubmit={this.handleSubmit}>
            <label>
              <input type="submit" value="Get Posts" />
            </label>
          </form>
        </div>
        <div>
          <h3>{this.returnFeed()}</h3>
        </div>
      </React.Fragment>
    );
  }
}

export default Timeline;
