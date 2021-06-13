Rails.application.routes.draw do
  root 'sessions#home'

  get 'auth/:provider/callback' => 'sessions#create_with_google_omniauth'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'teachers#new'
  post '/signup' => 'teachers#create'

  resources :students
  resources :courses do 
     resources :students, only: :index
  end
  resources :teachers
  resources :assignments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
