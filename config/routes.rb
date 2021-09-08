Rails.application.routes.draw do
  resources :users
  root 'home_pages#home'
  get 'home_pages/home'
  get 'home_pages/about', to: 'home_pages#about'
  get 'home_pages/contact', to: 'home_pages#contact'
  get '/signup', to: 'users#new' 
end
