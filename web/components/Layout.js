import React from "react"

import ProfileThumbnail from "./ProfileThumbnail"
import SearchBar from "./SearchBar"

export default class Layout extends React.Component {

  searchBarChange(tags) {
    console.log("hi i changed" + tags);
  }

  // Query to find profiles
  render() {
    return (
      <div>
        <SearchBar onChange={this.searchBarChange.bind(this)} endpoint="/search/tags_and_names"/>
        <div>Results</div>
        <ProfileThumbnail/>
      </div>
    );
  }
}
