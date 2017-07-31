Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :records, only: [:index, :create, :update]
      delete 'record' , to: 'records#destroy'
    end
  end
end
