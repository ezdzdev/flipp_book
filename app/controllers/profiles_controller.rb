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
    @profile = Profile.find(params[:id])
    render :erb => "profiles/index", :layout => false;
  end

  def update
    #TODO update only if current user has permission
    render text: @current_user
  end
end
