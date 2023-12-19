Rails.application.routes.draw do
  resources :appointments
  resources :patients
  resources :schedules
  resources :departments
  resources :doctors

  namespace :download do
    resources :appointments, only: %i[index]
    resources :patients, only: %i[index]
    resources :schedules, only: %i[index]
    resources :departments, only: %i[index]
    resources :doctors, only: %i[index]
    get "/all", to: "everything#index"
  end
  root "doctors#index"
end
