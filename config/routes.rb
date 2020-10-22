Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Health check endpoint for Kubernetes probes
  get 'healthz', to: 'index#healthz'

  # Redirect to a country from the actual root path
  root to: 'index#root'

  get '/uk', to: 'index#uk', as: 'uk'

  scope ':countryCode', countryCode: /uk/ do
    resources :networks, param: :slug, only: %i[index]
  end

  # Manage the records, add new networks, update prices, etc.
  get '/manage', to: redirect('/manage/countries')

  namespace :manage do
    resources :countries, only: %i[index new edit create update destroy]
    resources :networks, only: %i[index new edit create update destroy]

    resources :payg_plans, :membership_plans do
      resources :charging_rates, shallow: true
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
