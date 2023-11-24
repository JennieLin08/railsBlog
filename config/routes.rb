Rails.application.routes.draw do
  resources :articles
  resources :posts

  # get '/members' => 'members#index'
  # get '/members/new' => 'members#new', as: 'new_member'
  # put '/members/edit' => 'members#edit', as: 'edit_member'
  # post '/members' => 'members#create', as: 'create_member'

  get '/users' => 'users#index'
  get '/users/new' => 'users#new', as: 'new_user'
  get '/users/edit/:id(.:format)' => 'users#edit', as: 'edit_user'
  get '/users/:id(.:format)' => 'users#show', as: 'user'
  # patch '/users/:id' => 'users#'
  patch '/users/:id(.:format)' => 'users#update', as: 'update_user'
  post '/users' => 'users#create', as: 'create_user'
  delete '/users/:id(.:format)' =>'users#delete' , as: 'delete_user'                                                                             
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  get '/' => 'users#index'
  # root "posts#index"
end
