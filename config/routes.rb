Rails.application.routes.draw do
  root 'profiles#index'

  resources :profiles, only: [:index, :show, :update, :add_tags, :edit]
  post 'profiles/:id/add_tags' => 'profiles#add_tags'

  get 'search/profiles' => 'search#search_profiles'
  get 'search/tags' => 'search#search_tags'
  get 'search/tags_and_names' => 'search#search_tags_and_names'
end
