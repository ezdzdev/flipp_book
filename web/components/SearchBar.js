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

  // XXX
  // Ghetto ajax request copy-pasta as a promise
  httpGet_(theUrl, params) {
    return new Promise(function(res, rej) {
      var xmlhttp = new XMLHttpRequest();

      try {
        xmlhttp.onreadystatechange = (function() {
          if (xmlhttp.readyState!=4)
            return;

          if (xmlhttp.status==200) {
            var response = xmlhttp.responseText;
            res(JSON.parse(response));
          } else {
            var msg = "Failed to query from " + theUrl;
            rej(msg);
          }
        }).bind(this);

        xmlhttp.ontimeout = (function() {
          rej(msg);
        }).bind(this);

        xmlhttp.open( "GET", theUrl, true );
        xmlhttp.send();
      } catch(err) {
        var msg = this.getTranslation_('api_connection_error');
        rej(msg);
      }
    })
  }

  handleChange(e) {
    // If timer exists, clear the timeout
    if (this.timer != null) {
      clearTimeout(this.timer)
    }

    // Set timer
    this.timer = setTimeout(this.query.bind(this, e.target.value), 150)
  }

  // Query to populate suggested results
  query(text) {
    var that = this;
    this.httpGet_(this.props.endpoint + '?query=' + text).then(function(d) {
      that.props.onChange(d.profiles)
    })
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
