Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  resources :toppages, only: [:show]
  
  get 'signup', to: 'users#new'

  resources :users, only: [:show, :create, :edit, :update,:destroy,:destroy_confirm] do
   member do
     get :likes
   end
  end
  post 'users/confirm', to: 'users#confirm'
  patch 'users/edit/confirm/:id', to: 'users#edit_confirm'
  get 'users/delete/confirm/:id', to: 'users#destroy_confirm'
  
  # モーダル作成につき、一旦削除
  # get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :contracts
  post 'contracts/confirm', to: 'contracts#confirm'
  patch 'contracts/edit/confirm/:id', to: 'contracts#edit_confirm'
  get 'contracts/delete/confirm/:id', to: 'contracts#destroy_confirm'
  
  resources :claims, only: [:new, :create, :destroy]
  post 'claims/confirm', to: 'claims#confirm'
  get 'claims/complete', to: 'claims#complete'
  get 'claims_list', to: 'claims#claims_list'
  get 'claims_list/:id', to: 'claims#claims_list_show'
  get 'claims/:id', to: 'claims#show'
  
  namespace :admin do
    resources :info,only: [:show, :edit,:update]
    patch 'info/edit/confirm/:id', to: 'info#edit_confirm'
  end
  
  resources :posts, only: [:new,:create,:index,:show,:destroy]
  post 'posts/confirm', to: 'posts#confirm'
  get 'posts/delete/confirm/:id', to: 'posts#destroy_confirm'

  resources :likes, only: [:create, :destroy, :index]
  
  resources :guest_sessions, only: [:create]

end
