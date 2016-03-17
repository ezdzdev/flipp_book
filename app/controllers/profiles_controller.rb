class ProfilesController < ApplicationController
  def index
    respond_to do |format|
      format.json {
        render :json => Profile.all
      }
      format.html {}
    end
  end

  def show
    render json: Profile.find(params[:id])
  end

  def update
    #TODO update only if current user has permission
    render text: @current_user
  end
end
