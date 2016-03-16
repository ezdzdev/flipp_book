class ProfileController < ApplicationController
  def index
    render text: "index"
  end

  def edit
    render text: "profile"
  end
end
