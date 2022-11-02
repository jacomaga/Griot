Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :publishers, only: %i[create destroy show index update]
      resources :pictures, only: %i[create destroy update show index]
      resources :categories, only: %i[]
    end
  end
end
