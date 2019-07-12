Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :contacts
  end
  resources :contacts
  get '/search' => 'contacts#search', :as => 'search_page'

  root to: 'welcome#index'
end
