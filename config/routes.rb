Rails.application.routes.draw do
  resources :receivables
  resources :billentries do
    collection do
      get 'company_data'
    end
  end
  resources :companies, only: [:show, :index, :create, :new]
  resources :trucks
  root to: 'welcome#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
