Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :key_values, param: :key
    end
  end
end
