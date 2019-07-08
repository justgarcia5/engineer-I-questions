Rails.application.routes.draw do
  resources :contacts

  root to: 'contacts#index'
end
