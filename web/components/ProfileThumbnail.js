import React from "react"

export default class ProfileThumbnail extends React.Component {
  constructor() {
    super();
  }

  showProfile() {
    window.location.pathname = "/profiles/" + this.props.profile.id
  }

  render() {
    return (
      <div class="profile" onClick={this.showProfile.bind(this)}>
        <img class="profile-thumbnail" src={this.props.profile.image_url}/>
        <span class="profile-name">{this.props.profile.name}</span>
      </div>
    );
  }
}
