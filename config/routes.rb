Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Health check endpoint for Kubernetes probes
  get 'healthz', to: 'index#healthz'

  # Redirect to a country from the actual root path
  get '/', to: 'index#root', as: 'apex'

  get '/:country', country: /uk/, to: 'index#index', as: 'root'

  scope '/:country', country: /uk/ do
    resources :networks, param: :slug, only: [:index, :show]
  end

  # Manage the records, add new networks, update prices, etc.
  namespace :manage do
    resources :country, :networks

    resources :payg_plans, :membership_plans do
      resources :charging_rates, shallow: true
    end
  end
end
