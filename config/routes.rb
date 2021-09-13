Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
  }

  root 'home_pages#home'
  get 'home_pages/home'
  get 'home_pages/about', to: 'home_pages#about'
  get 'home_pages/contact', to: 'home_pages#contact'
  resources :users
  resources :rooms

  resources :rooms do
    resources :images, only: [:create, :destroy]
    member do
      get 'listing'
      get 'description'
      get 'price'
      get 'photos'
      get 'amenities'
      get 'location'
    end
  end
end
