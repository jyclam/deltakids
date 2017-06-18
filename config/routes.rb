Rails.application.routes.draw do


  get 'sessions/new'

  get '/', to: 'welcome#index', as: :home
  # resources :welcome, only: :index
	resources :activities

	resources :sports

  resources :organizations, only: [:new, :create]
  
  resources :sessions, only: [:new, :create] do 
	delete :destroy, on: :collection 
  end



end
