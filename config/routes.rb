Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :records, only: [:index, :create, :destroy]
    end
  end
end
