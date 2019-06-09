Rails.application.routes.draw do
  root 'home#index'

  resources :goals do
    member do
      get 'set_fact_day', to: 'goals#set_fact_day'
      patch 'set_fact_day', to: 'goals#update_fact_day'
      put 'set_fact_day', to: 'goals#update_fact_day'
    end
  end

  devise_for :users
end
