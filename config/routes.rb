Rails.application.routes.draw do
  root 'transactions#index'

  resources :transactions, only: [:index, :edit, :update] do
    collection do 
      get 'new/step1', to: 'transactions#step1'
      get 'new/step2', to: 'transactions#step2'
      post :validate_step
    end
      
    put :change_status
  end
end
