class ProfilesController < ApplicationController
  def index
  end

  def show
    render json: @current_user.to_json
  end

  def update
    #TODO update only if current user has permission
    render text: @current_user
  end
end
