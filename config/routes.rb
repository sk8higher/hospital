Rails.application.routes.draw do
  resources :appointments
  resources :patients
  resources :schedules
  resources :departments
  resources :doctors

  root "doctors#index"
end
