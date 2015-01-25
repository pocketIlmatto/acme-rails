Rails.application.routes.draw do
  devise_for :users
  root to: 'visitors#index'
  
  resources :users

  resources :patients, except: [:destroy] do
    resources :patient_vital_signs, only: [:create]
  end

  get "patient/new_vital_sign" => 'patient#new_vital_sign', :as => :new_vital_sign
end