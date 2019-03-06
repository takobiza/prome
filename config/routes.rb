Rails.application.routes.draw do

  devise_for :users
  resources :templates do
    resources :profiles
  end
  resources :respondents

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/profiles/complete', to: 'profiles#complete'
end
