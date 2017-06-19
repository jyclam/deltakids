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

  namespace :admin do
	resources :organizations, only: :index
  end

  resources :activity




  get '/learn/surveys', to: 'learn#surveys'
  get '/learn/live', to: 'learn#live', as: :learn_live
  resources :resources, path: '/learn/resources' do
    post '/filters',to: 'resources#filter', as: :filter, on: :collection
  end

  namespace :services do
    resources :pandb, only: [:index, :show]
    resources :children, only: [:index, :show]
    resources :families, only: [:index, :show]
  end
  resources :services

  namespace :admin do
    resources :users, only: :index
  end
end
