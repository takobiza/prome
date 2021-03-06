Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :templates do
    resources :profiles, except: [:update, :edit]
  end

  resources :respondents

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/profiles/complete', to: 'profiles#complete'
end
