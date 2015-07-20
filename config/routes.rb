Rails.application.routes.draw do

  devise_for :admins
  root to: 'pages#home'

  api_version module: 'api/v1', path: { value: 'api/v1' }, default: true do
    resources :uploads, only: [:index, :create] do
      member do
        post :import
      end
    end
  end

end
