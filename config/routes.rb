Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get "/users/me" => "users#me"
      put "/users" => "users#update"
      resources :users
    end
  end
end
