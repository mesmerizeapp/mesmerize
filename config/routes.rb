Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }, skip: [:sessions, :registrations]
  match 'users/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  as :user do
    post '/login' => 'users/sessions#create', as: :user_session
    delete '/logout' => 'users/sessions#destroy', as: :destroy_user_session
  end

  get '/feed', to: 'ideas#index'

  resources :teams, param: :name do
    resources :memberships, except: [:show, :index]
  end

  scope ':username' do
    get '', to: 'profiles#show', as: :profile

    resources :ideas, except: [:index] do
      resources :comments
      resources :resources
      resource :description do
        resources :comments
      end

      post '/votes', to: 'votes#create', as: :vote
      delete '/votes', to: 'votes#destroy', as: :unvote
    end
  end
end
