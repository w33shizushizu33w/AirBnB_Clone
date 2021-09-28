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
  get 'search', to: 'search#search'
  resources :users
  resources :rooms

  resources :rooms do
    resources :images, only: [:create, :destroy]
    resources :reservations
    member do
      get 'listing'
      get 'description'
      get 'price'
      get 'photos'
      get 'amenities'
      get 'location'
      get 'more_listings'
      get 'check_current_bookings'
      get 'review_booking'
    end
  end
end
