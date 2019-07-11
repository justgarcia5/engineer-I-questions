Rails.application.routes.draw do
  resources :contacts
  get '/search' => 'contacts#search', :as => 'search_page'

  root to: 'contacts#index'
end
