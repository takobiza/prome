Rails.application.routes.draw do

  devise_for :users
  resources :templates do
    resources :profiles
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
