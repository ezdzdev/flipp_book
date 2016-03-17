import React from "react"

import TagsInput from 'react-tagsinput'

export default class SearchBar extends React.Component {

  constructor() {
    super();

    // Init timer variable
    this.timer = null;

    this.state = {
      text: "",
      tags: ["a", "b"]
    }
  }

  handleChange(e) {
    // If timer exists, clear the timeout
    if (this.timer != null) {
      clearTimeout(this.timer)
    }

    // Set timer
    this.timer = setTimeout(this.query.bind(this), 150)
  }

  // Query to populate suggested results
  query() {
    // Query server
    // Return promise
    this.props.onChange(this.state.tags);
  }

  render() {
    return (
      <div>
        <input onChange={this.handleChange.bind(this)}/>
      </div>
    );
  }
}

// <TagsInput value={this.state.tags} onChange={this.handleChange.bind()} />