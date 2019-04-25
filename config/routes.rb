Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "all_exercises/index"
      get "all_exercises/abs"
      get "all_exercises/arms"
      get "all_exercises/back"
      get "all_exercises/calves"
      get "all_exercises/chest"
      get "all_exercises/legs"
      get "all_exercises/shoulders"
      resources :users
      resources :exercise
      resources :workouts
      resources :workout_exercises
      resources :imported_exercises
    end
  end
end
