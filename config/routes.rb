Rails.application.routes.draw do

  root to: 'welcome#home'

  resources :subjects, except: :new do
    resources :areas, except: :new
  end

  resources :scientists do
    resources :theorems, only: [:show, :create, :destroy]
  end
  resources :theorems

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users, only: [:index, :show, :destroy]
  post '/users/:id/make_admin', to: 'users#make_admin'

end
