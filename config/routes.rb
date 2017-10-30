Rails.application.routes.draw do
  resources :theorems
  resources :scientists
  resources :subjects, except: :new do
    resources :areas, except: :new
  end
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#home'
  resources :users, only: [:index, :show, :destroy]
  post '/users/:id/make_admin', to: 'users#make_admin'
end
