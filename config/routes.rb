Rails.application.routes.draw do
  devise_for :users

root "foodie#index"
  
end
