import React from "react"

import TagsInput from 'react-tagsinput'

export default class SearchBar extends React.Component {

  constructor() {
    super();
    if (this.props.queryType == 'tags') {
      this.props.endpoint = "/search/tags_and_names.json";
    } else {
      this.props.endpoint = "/search/tags.json";
    }
  }

  // XXX
  // Ghetto ajax request copy-pasta
  httpGet_(theUrl, callback, errorCallback) {
    var xmlhttp = new XMLHttpRequest();

    try {
      xmlhttp.onreadystatechange = (function() {
        if (xmlhttp.readyState!=4)
          return;

        if (xmlhttp.status==200) {
          var response = xmlhttp.responseText;
          callback(response);
        } else {
          var msg = "Failed to query from " + theUrl;
          errorCallback(msg);
        }
      }).bind(this);

      xmlhttp.ontimeout = (function() {
        errorCallback(msg);
      }).bind(this);

      xmlhttp.open( "GET", theUrl, true );
      xmlhttp.send();
    } catch(err) {
      var msg = this.getTranslation_('api_connection_error');
      errorCallback(msg);
    }
  }

  handleChange {
    if (!!timeout) {
      timeout.cancel
    }

    timeout = setTimeout((function() {

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
