Rails.application.routes.draw do

  devise_for :users
  resources :courses do
    collection do
      get :last_course
    end
  end
  root "courses#index"
end
