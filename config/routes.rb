Rails.application.routes.draw do
  resources :media_files
  devise_for :users
  root 'media_files#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
