Rails.application.routes.draw do

  resources :apartments, only: [:create, :index, :update, :destroy]
  resources :tenants, only: [:create, :index, :update, :destroy]
  resources :leases, only: [:create, :destroy]

end
