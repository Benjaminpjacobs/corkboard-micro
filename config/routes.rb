Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :records, only: [:index, :create]
      delete 'record', to: 'records#destroy'
      put 'record', to: 'records#update'
    end
  end
end
