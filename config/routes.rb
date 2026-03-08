Rails.application.routes.draw do
  resources :categories
  resources :tags
  resources :items
  resources :trips do
    member do
      get :copy
      post :create_copy
    end
    resources :trip_items, only: [:create, :destroy] do
      member do
        patch :toggle_packed
      end
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  root "trips#index"
end
