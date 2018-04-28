Rails.application.routes.draw do
  devise_for :users
  resources :bookers
  resources :users

  root 'users#home'

  get '/top' => 'bookers#top', as: 'top'
  get '/about' => 'bookers#about', as: 'about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
