Rails.application.routes.draw do

	root 'bookers#top'
	get '/top' => 'bookers#top', as: 'top'

  resources :bookers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
