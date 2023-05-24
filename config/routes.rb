Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: {
    confirmations: 'custom_confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'registrations'
  }

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  delete 'users/sign_out', to: 'devise/sessions#destroy'

  get "/admin", to: "pages#admin", as: "admin"
end
