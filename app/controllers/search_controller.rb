class SearchController < ApplicationController

  def search_tags
    term = params[:term].downcase.gsub(/[^a-z0-9]/, '')

    matches = Tag.search(term)

    respond_to do |format|
      format.json {
        render :json => matches.to_json
      }
    end
  end

  def search_tags_and_names
    term = params[:term].downcase.gsub(/[^a-z0-9]/, '')

    tag_matches = Tag.search(term)

    profile_matches = Profile.search(term)

    respond_to do |format|
      format.json {
        render :json => {
          :tags => tag_matches,
          :profiles => profile_matches
        }
      }
    end
  end

  def search_tags_and_profiles
    # TODO
  end

end
