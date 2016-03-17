import React from "react"

export default class ProfileThumbnail extends React.Component {
  constructor() {
    super();
    // TODO edit default
    this.state = {
      id: 1,
      thumbnail: '//www.freelanceme.net/Images/default%20profile%20picture.png',
      name: 'ezdz'
    }
  }

  showProfile() {
    window.location.pathname = "/profiles/" + this.state.id
  }

  render() {
    return (
      <div onClick={this.showProfile.bind(this)}>
        <img class="profile-thumbnail" src={this.state.thumbnail}/>
        <span class="profile-name">{this.state.name}</span>
      </div>
    );
  }
}
