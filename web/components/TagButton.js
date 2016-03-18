import React from "react"

export default class TagButton extends React.Component {
  constructor() {
    super();
  }

  showProfile() {
    // window.location.pathname = "/profiles/" + this.props.profile.id
  }

  render() {
    return (
      <a>
        <span>{this.props}</span>
      </a>

    );
  }
}
