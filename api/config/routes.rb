Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'authenticate', to: 'authentication#authenticate'
      resources :authentication
      resources :users
      resources :pets
      resources :adopcions
    end
  end

  
end
