class SearchController < ApplicationController

  def index
    render 'profiles/index'
  end

  def search_tags
    term = params[:term].downcase.gsub(/[^a-z0-9]/, '')

    matches = Tag.search(term)

    respond_to do |format|
      format.json {
        render :json => matches.to_json
      }
    end
  end

  def search_profiles
    full_query = params[:query]

    all_name_matches = []
    all_tag_matches = []

    full_query.split.each do |term|
      term = term.downcase.gsub(/[^a-z0-9]/, '')

      name_matches = Profile.search(term)
      all_name_matches << name_matches

      Tag.search(term).each do |tag|
        all_tag_matches << tag.profiles
      end
    end

    all_name_matches = all_name_matches.flatten.uniq
    all_tag_matches = all_tag_matches.flatten.uniq

    all_matches = all_name_matches | all_tag_matches

    respond_to do |format|
      format.json {
        render :json => {
          :profiles => all_matches
        }
      }
    end
  end

  def search_tags_and_names
    full_query = params[:query]

    all_tags =  []
    all_profiles =  []

    full_query.split.each do |term|
      term = term.downcase.gsub(/[^a-z0-9]/, '')

      tag_matches = Tag.search(term)

      tagged_profile_matches = tag_matches.map(&:profiles)

      profile_matches = Profile.search(term)

      all_tags << tag_matches
      all_profiles << profile_matches
      all_profiles << tagged_profile_matches
    end

    respond_to do |format|
      format.json {
        render :json => {
          :tags => all_tags,
          :profiles => all_profiles
        }
      }
    end
  end

  def search_tags_and_profiles

  end

end
