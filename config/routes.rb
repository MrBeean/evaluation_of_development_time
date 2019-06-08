Rails.application.routes.draw do
  root 'home#index'

  resources :goals do
    member do
      get :set_fact_day
    end
  end

  devise_for :users
end
