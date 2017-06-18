Rails.application.routes.draw do

  get '/', to: 'welcome#index', as: :home
  # resources :welcome, only: :index
	resources :activities


  # resources :services
  # get '/:category_id/'
  # resources :categories, only: [:index]
  # get '/categories/:category_id', to: 'categories#index'
  resources :services

end
