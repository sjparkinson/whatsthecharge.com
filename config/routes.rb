Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'healthz', to: 'index#healthz'

  get '/', to: 'index#root', as: 'apex'

  get '/:country', country: "uk", to: 'index#index', as: 'root'

  scope '/:country', country: "uk" do
    resources :networks, param: :slug, only: [:index, :show]
  end
end
