Rails.application.routes.draw do
  resources :masks, only: :index
end
