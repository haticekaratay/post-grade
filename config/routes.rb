Rails.application.routes.draw do
  root 'sessions#home'

  get 'auth/:provider/callback' => 'sessions#create_with_google_omniauth'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'teachers#new'
  post '/signup' => 'teachers#create'

  get '/statistics' => 'statistics#index'
  
  get "statistics_json" =>  "charts#statistics_json"

  get "/courses/:id/statistics" => "statistics#index"

  resources :students
  post "/students/:student_id/assignments/:id" => "student_assignments#update", as: "update_student_grade"
  resources :courses do 
     resources :students, only: [:index, :edit, :update, :show, :create]
  end
  resources :courses do
    resources :assignments, except: :destroy
  end
  
  resources :students do
    resources :student_assignments,  only: [:edit, :update]
  end
  
  
  resources :teachers
  resources :assignments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
