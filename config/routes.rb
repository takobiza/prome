Rails.application.routes.draw do

  get 'templates/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'templates#index'
end
