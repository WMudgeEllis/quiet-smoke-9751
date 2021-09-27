Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :hospitals do
    resources :doctors
  end
  resources :doctor_patients
  resources :patients
end
