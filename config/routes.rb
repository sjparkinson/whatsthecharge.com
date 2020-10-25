require 'country_constraints'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Health check endpoint for Kubernetes probes
  get 'healthz', to: 'index#healthz'

  # Redirect to a country from the actual root path
  root to: 'index#root'

  scope ':countryCode', countryCode: /[a-z]{2}/, constraints: CountryConstraints.new, defaults: { countryCode: 'gb' } do
    resources :networks, param: :slug, only: %i[index]
  end

  # Manage the records, add new networks, update prices, etc.
  get '/manage', to: redirect('/manage/countries')

  namespace :manage do
    resources :countries, only: %w[index new edit create update destroy]
    resources :networks, only: %w[index new edit create update destroy]
    resources :payg_plans
    resources :membership_plans
  end

  get 'login', to: 'manage/sessions#new'
  post 'login', to: 'manage/sessions#create'
  delete 'logout', to: 'manage/sessions#destroy'

  get '404', to: 'errors#not_found'
  get '422', to: 'errors#unprocessable_entity'
  get '500', to: 'errors#internal_server_error'
end
