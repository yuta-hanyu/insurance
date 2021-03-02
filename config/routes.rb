Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  resources :toppages, only: [:show]

  resources :users, only: [:show, :create, :edit, :update, :destroy, :destroy_confirm] do
   member do
     get :likes
   end
  end
  # post 'users/confirm', to: 'users#confirm'
  # patch 'users/edit/confirm/:id', to: 'users#edit_confirm'
  get 'users/delete/confirm/:id', to: 'users#destroy_confirm'
  
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :contracts, only: [:index, :create, :destroy, :update]
  # patch 'contracts/edit/confirm/:id', to: 'contracts#edit_confirm'
  
  resources :claims, only: [:new, :create, :destroy]
  get 'claims_list', to: 'claims#claims_list'
  
  namespace :admin do
    resources :info,only: [:show, :edit, :update]
    # patch 'info/edit/confirm/:id', to: 'info#edit_confirm'
  end
  
  resources :posts, only: [:new, :create, :index, :show, :destroy]
  # get 'posts/delete/confirm/:id', to: 'posts#destroy_confirm'

  resources :likes, only: [:create, :destroy, :index]
  
  resources :guest_sessions, only: [:create]
  
  resources :contacts, only: [:index, :create, :destroy]
  
  resources :comments, only: [:index, :create, :destroy]
  get 'comments/:id', to: 'comments#show'

end
