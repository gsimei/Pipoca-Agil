Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: {
    confirmations: 'custom_confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations'
  }

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
    get '/confirmation_pending', to: 'registrations#confirmation_pending', as: 'confirmation_pending'
  end

  get '/signup', to: 'registrations#new', as: 'signup'
  resources :registrations, only: [:new, :create], path: 'signup', path_names: { new: '' } do
    collection do
      get 'confirmation_pending', to: 'registrations#confirmation_pending'
    end
  end

  delete '/users/sign_out', to: 'devise/sessions#destroy'

  get '/email_confirmation/confirm', to: 'email_confirmation#confirm', as: 'confirm_email'
  post '/email_confirmation/send_confirmation_email', to: 'email_confirmation#send_confirmation_email_request', as: 'send_confirmation_email'

  get '/admin', to: 'pages#admin', as: 'admin'

  get '/confirmation_pending', to: redirect('/')

  get "/privacy", to: "pages#privacy", as: "privacy"
end
