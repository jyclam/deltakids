Rails.application.routes.draw do

  get '/', to: 'welcome#index', as: :home
  # resources :welcome, only: :index
	resources :activities


  get '/learn/surveys', to: 'learn#surveys'
  get '/learn/live', to: 'learn#live', as: :learn_live
  resources :resources, path: '/learn/resources'

end
