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
      <div class="profile-container">
        <div class="profile" onClick={this.showProfile.bind(this)}>
          <img class="profile-thumbnail" src={this.props.profile.image_url}/>
          <div class="info">
            <span class="profile-name">{this.props.profile.name}</span>
            <span class="profile-role">{this.props.profile.role}</span>
          </div>
        </div>
      </div>
    );
  }
}
