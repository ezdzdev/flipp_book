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
    if @current_user == @profile
      render "profiles/edit", :layout => false
    else
      render "profiles/show", :layout => false
    end
  end

  def edit
    @profile = Profile.find(params[:id])
    if @current_user == @profile
      render "profiles/edit", :layout => false
    else
      render :nothing => true, :status => :unauthorized
    end
  end

  def update

  end

  # LENARD TODO
  def add_tags
    @profile = Profile.find(params[:id])
    if @current_user == @profile
      tags = params[:tags]
      @profile.add_tags(tags) unless tags.blank?

      @profile.update_attribute(:facebook, true) if params[:facebook]
      @profile.update_attribute(:linkedin, true) if params[:linkedin]

      render json: { message: "success" }
    end
  end
end
