Rails.application.routes.draw do
  devise_for :social_accounts, controllers:{
    omniauth_callbacks: "omniauth_callbacks"
  }
  root "top#index"
  get "top/profile"
  get "top/excercise"
  resources :users
end
