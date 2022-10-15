Rails.application.routes.draw do
  get 'plant_tags/new'
  resources :gardens do
    resources :plants, only: :create
  end

  resources :plants, except: :create do
    resources :plant_tags, only: [:new, :create]
  end
  resources :plant_tags, only: :destroy
  resources :plants, only: :destroy
end
