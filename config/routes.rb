require 'routing_constraints/country_constraint'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Health check endpoint for Kubernetes probes
  get 'healthz', to: 'index#healthz'

  # Redirect to a country from the actual root path
  root to: 'index#root'

  scope ':countryCode', countryCode: /[a-z]{2}/, constraints: CountryConstraint.new do
    get '/', to: 'index#country', as: 'country'
    resources :networks, param: :slug, only: %i[index]
  end

  # Manage the records, add new networks, update prices, etc.
  get '/manage', to: redirect('/manage/countries')
  namespace :manage, except: %w[show] do
    resources :countries
    resources :networks

    resources :payg_plans do
      resources :payg_plan_costs
    end

    resources :membership_plans
  end

  get 'login', to: 'manage/sessions#new'
  post 'login', to: 'manage/sessions#create'
  delete 'logout', to: 'manage/sessions#destroy'
end
