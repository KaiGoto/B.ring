Rails.application.routes.draw do
  root to: 'homes#top'
  get 'search/search'
  get '/about' => 'homes#about'
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }

  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update]
    resources :places, only: [:index, :show, :new, :edit, :update, :create ]
    resources :regions, only: [:index, :show, :edit, :update, :create]
  end

  devise_for :users, skip: :all
  devise_scope :user do
    get 'users/sign_in' => 'public/sessions#new', as: 'new_user_session'
    post 'users/sign_in' => 'public/sessions#create', as: 'user_session'
    get 'users/sign_out' => 'public/sessions#destroy', as: 'destroy_user_session'
    get 'users/sign_up' => 'public/registrations#new', as: 'new_user_registration'
    post 'users' => 'public/registrations#create', as: 'user_registration'
    get 'users/password/new' => 'public/passwords#new', as: 'new_user_password'
    get '/searches' => 'searches#search'
  end

  scope module: :public do
    resources :users, only: [:show, :edit, :update]
    resources :places, only: [:index, :show] do
      resources :place_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :regions, only: [:index, :show]
    resources :contacts, only: [:new, :create]
    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contacts/back', to: 'contacts#back', as: 'back'
    get 'done', to: 'contacts#done', as: 'done'
  end
end
