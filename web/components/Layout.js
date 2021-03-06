

import React from "react"

import ProfileThumbnail from "./ProfileThumbnail"
import SearchBar from "./SearchBar"

export default class Layout extends React.Component {
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

  constructor() {
    super();
    this.state = {
      profiles: []
    }

    var that = this;
    if (!!window.initialQuery) {
      this.httpGet_("/search/profiles.json?query=" +
                    window.initialQuery).then(function(d) {
        d = d['profiles']
        var arr = []
        for (var i = 0; i < d.length; i++) {
          arr.push(<ProfileThumbnail key={i} profile={d[i]}/>)
        }
        that.setState({profiles: arr})
      });
    }

    else {
      this.httpGet_("/profiles.json").then(function(d) {
        var arr = []
        for (var i = 0; i < d.length; i++) {
          arr.push(<ProfileThumbnail key={i} profile={d[i]}/>)
        }
        that.setState({profiles: arr})
      });
    }

  }

  searchBarChange(results) {
    var arr = []
    for (var i = 0; i < results.length; i++) {
      arr.push(<ProfileThumbnail key={i} profile={results[i]}/>)
    }
    this.setState({profiles: arr})
  }

  // Query to find profiles
  render() {
    var searchBarStyle = {
      width: '100%'
    };

    return (
      <div>
        <SearchBar style={searchBarStyle} className="derp" initialQuery={window.initialQuery} onChange={this.searchBarChange.bind(this)} endpoint="/search/profiles.json"/>
        {this.state.profiles}
      </div>
    );
  }
}
