Rails.application.routes.draw do
  resources :locations
  resources :lights do
    member do
      post :turn_on
      post :turn_off
    end
  end
end
