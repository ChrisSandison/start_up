Rails.application.routes.draw do
  devise_for :users

  resource :ideas
  
  root to: "home#index"

  get 'dashboard' => 'dashboard#index'
end
