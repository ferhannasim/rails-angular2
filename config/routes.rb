Rails.application.routes.draw do
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: [:create]
      resources :books
      
    end
  end
  
  # match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # match 'auth/failure', to: redirect('/'), via: [:get, :post]
  # match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
# delete '/logout', to: 'sessions#destroy'
# get '/auth/:provider/callback', to: 'sessions#create'
# get '/auth/failure', to: 'sessions#auth_failure'