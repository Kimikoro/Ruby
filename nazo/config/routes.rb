Rails.application.routes.draw do
  get '/top' => 'cups#top'

  get '/cups/main' => 'cups#new'
  delete '/cups/:id' => 'cups#destroy', as: :destroy_cup
  get '/cups' =>'cups#index', as: :cups
	resources :cups, :except => [:new, :destroy,:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
