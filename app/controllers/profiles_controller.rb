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
    render :erb => "profiles/index"
  end

  def update
    #TODO update only if current user has permission
    render text: @current_user
  end

  # LENARD TODO
  def add_tags
    tags = params[:tags]

    render nothing: true if tags.blank?

    @profile = Profile.find(params[:id])
    @profile.add_tags(tags)

    render nothing: true
  end
end
