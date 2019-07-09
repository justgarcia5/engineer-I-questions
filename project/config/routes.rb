Rails.application.routes.draw do
  get '/search' => 'contacts#search', :as => 'search_page'
  resources :contacts

  root to: 'contacts#index'
end
