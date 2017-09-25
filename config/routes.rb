Rails.application.routes.draw do
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: [:create]
      resources :books
      
    end
  end

end

