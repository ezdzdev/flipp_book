import React from "react";
import ReactDOM from "react-dom";

import ProfileThumbnail from "./components/ProfileThumbnail";
import SearchBar from "./components/SearchBar";

// Render DOM call
ReactDOM.render(
  <div>
    <SearchBar endpoint="/search/tags_and_names"/>
    <ProfileThumbnail/>
  </div>
  ,document.getElementById("app")
)