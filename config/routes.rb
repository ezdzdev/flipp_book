Rails.application.routes.draw do
  root 'profiles#index'

  resources :profiles, only: [:index, :show, :update, :edit]
  post 'profiles/:id/add_tags' => 'profiles#add_tags'
  post 'profiles/:id/remove_tags' => 'profiles#remove_tags'

  get 'search/profiles' => 'search#search_profiles'
  get 'search/tags' => 'search#search_tags'
  get 'search/tags_and_names' => 'search#search_tags_and_names'
  get 'search/autocomplete_tag' => 'search#autocomplete_tag'
end
