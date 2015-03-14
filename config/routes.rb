Rails.application.routes.draw do
  devise_for :users

  resource :ideas
  resource :likes do
    post :new_like
    post :new_dislike
  end
  
  root to: "home#index"

  get 'dashboard' => 'dashboard#index'

  namespace :api do
    namespace :v1 do
      resources :ideas
    end
  end
end
