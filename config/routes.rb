Rails.application.routes.draw do
  resources :receivables
  resources :billentries do
    collection do
      get 'company_data'
    end
  end
  resources :companies, only: [:show, :index, :create, :new]
  resources :trucks
  # get 'reports', to: 'reports#index'
  get 'bill_reports', to: 'reports#bill_report'
  get 'report_print', to: 'reports#report_print'

  resources :reports, only: [:index]
  # do
    # collection do
    #   get 'report_data'
    # end
  # end

  root to: 'welcome#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
