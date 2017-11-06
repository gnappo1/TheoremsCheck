Rails.application.routes.draw do

  root to: 'welcome#home'

  resources :subjects, except: :new do
    resources :areas, except: :index
  end

  resources :scientists do
    resources :theorems
  end
  resources :theorems

  post '/scientists/:id/unsave_scientist' => 'scientists#unsave_scientist', :as => :unsave_scientis
  post '/scientists/:id/save_scientist' => 'scientists#save_scientist', :as => :save_scientist

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:index, :show, :destroy]
  post '/users/:id/make_admin', to: 'users#make_admin'
  get '/users/:id/areas_created', to: 'users#areas_created'
  get '/users/:id/subjects_created', to: 'users#subjects_created'
  get '/users/:id/theorems_created', to: 'users#theorems_created'
  get '/users/:id/scientists_created', to: 'users#scientists_created'

end
