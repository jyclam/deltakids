Rails.application.routes.draw do

  get '/', to: 'welcome#index', as: :home
  # resources :welcome, only: :index
	resources :activities


  namespace :services do
    resources :pandb, only: [:index, :show]
    resources :children, only: [:index, :show]
    resources :families, only: [:index, :show]
  end
  resources :services
end
