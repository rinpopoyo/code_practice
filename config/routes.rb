Rails.application.routes.draw do
  root "top#index"
  get "top/profile"
  get "top/excercise"
end
