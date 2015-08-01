Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }, skip: [:sessions, :registrations]

  as :user do
    get '/login' => 'devise/sessions#new', as: :new_user_session
    post '/login' => 'devise/sessions#create', as: :user_session
    delete '/logout' => 'devise/sessions#destroy', as: :destroy_user_session

    get '/users/cancel' => 'devise/registrations#cancel', as: :cancel_user_registration
    post '/users' => 'devise/registrations#create', as: :user_registration
    get '/signup' => 'devise/registrations#new', as: :new_user_registration
    get '/users/edit' => 'devise/registrations#edit', as: :edit_user_registration
    match '/users' => 'devise/registrations#update', via: [:patch, :put]
  end

  scope ':username' do
    get '', to: 'profiles#index', as: :profile

    resources :ideas do
      resources :comments
      resource :description do
        resources :comments
      end

      post '/votes', to: 'votes#create', as: :vote
      delete '/votes', to: 'votes#destroy', as: :unvote
    end
  end
end
