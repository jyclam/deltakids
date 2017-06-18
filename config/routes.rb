Rails.application.routes.draw do


  get '/', to: 'welcome#index', as: :home
  # resources :welcome, only: :index
	resources :activities

	resources :sports

  resources :organizations, only: [:new, :create]

  get '/learn/surveys', to: 'learn#surveys'
  get '/learn/live', to: 'learn#live', as: :learn_live
  resources :resources, path: '/learn/resources' do
    post '/filters',to: 'resources#filter', as: :filter, on: :collection
  end

end
