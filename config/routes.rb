Rails.application.routes.draw do


  get '/', to: 'welcome#index', as: :home
  # resources :welcome, only: :index
	resources :activities

	resources :sports

  resources :organizations, only: [:new, :create]

end
