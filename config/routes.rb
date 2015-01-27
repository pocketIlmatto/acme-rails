Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "devise_custom/registrations"}
  root to: 'visitors#index'
  
  resources :user_organizations, only: [:index]

  resources :patients, except: [:destroy] do
    resources :patient_vital_signs, only: [:create]
    resources :patient_vital_sign_groups, only: [:create]
  end

  resources :patient_vital_signs, only: [:update]

  

  #api 
  namespace :api do
    namespace :v1 do
      resources :patients, only: [:index, :show, :create]
    end
  end

end