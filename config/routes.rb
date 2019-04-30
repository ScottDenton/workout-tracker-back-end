Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "all_exercises/index"
      post "all_exercises/find"
      post "all_exercises/userWorkouts"
      post "all_exercises/userExercises"
      post "all_exercises/exercisesByWorkout"

      get "all_exercises/abs"
      get "all_exercises/arms"
      get "all_exercises/back"
      get "all_exercises/calves"
      get "all_exercises/chest"
      get "all_exercises/legs"
      get "all_exercises/shoulders"

      get "sessions/new"
      post "sessions/create"
      get "sessions/destroy"

      post "exercise/getDescription"

      resources :users
      resources :exercise
      resources :workouts
      resources :workout_exercises
      resources :imported_exercises
    end
  end
end
