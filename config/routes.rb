Rails.application.routes.draw do
  root 'transactions#index'

  resources :transactions, only: [:index, :show] do
    collection do 
      get 'new/step1', to: 'transactions#step1'
      post :validate_step
    end
  end
end
