Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "devise_custom/registrations"}
  root to: 'visitors#index'
  
  #resources :users
  resources :user_organizations, only: [:index]

  resources :patients, except: [:destroy] do
    resources :patient_vital_signs, only: [:create]
  end

  resources :patient_vital_signs, only: [:update]

  get "patient/new_vital_sign" => 'patient#new_vital_sign', :as => :new_vital_sign
end