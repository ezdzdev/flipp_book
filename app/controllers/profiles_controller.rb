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

  def add_tags
    @profile = Profile.find(params[:id])
    if @current_user == @profile
      tags = params[:tags]
      new_tags = tags.present? ? @profile.add_tags(tags) : []

      @profile.update_attribute(:facebook, true) if params[:facebook]
      @profile.update_attribute(:linkedin, true) if params[:linkedin]

      render json: { message: "success",
        tags_added: new_tags.map(&:name)
      }
    end
  end

  def remove_tags
    @profile = Profile.find(params[:id])
    if @current_user == @profile
      tags = params[:tags]
      tags_removed =  tags.present? ? @profile.remove_tags(tags) : []

      render json: { message: "success",
        tags_removed: tags_removed.map(&:name)
      }
    end
  end
end
