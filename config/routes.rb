Rails.application.routes.draw do
  #root 'sessions#home'
  root 'sessions#new'

  get 'auth/:provider/callback' => 'sessions#create_with_google_omniauth'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'teachers#new'
  post '/signup' => 'teachers#create'

  get '/statistics' => 'statistics#index'
  
  get "statistics_json" =>  "charts#statistics_json"

  get "/courses/:id/statistics" => "statistics#index"

  post "/students/:student_id/assignments/:id" => "student_assignments#update", as: "update_student_grade"
  resources :courses, only: :show do 
     resources :students, only: [:index, :edit, :update, :show, :create]
  end
  resources :courses, only: :show  do
    resources :assignments, except: :destroy
  end
  
  resources :students do
    resources :student_assignments,  only: [:edit, :update]
  end
  
  resources :teachers, only: :show
  resources :assignments
end
