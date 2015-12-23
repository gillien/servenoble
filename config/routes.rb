Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.persisted? } do
    mount Upmin::Engine => '/admin', as: 'admin'
  end

  devise_for :users

  resources :articles, 	only: [:index, :update]
  resource :dashboard,  only: [:index]

  root 'dashboard#index'
end
