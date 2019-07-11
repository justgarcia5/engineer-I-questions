Rails.application.routes.draw do
  devise_for :users
  resources :contacts
  get '/search' => 'contacts#search', :as => 'search_page'

  root to: 'home#index'
end
