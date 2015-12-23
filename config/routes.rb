Rails.application.routes.draw do
  authenticated :user, lambda { |u| u.persisted? } do
    mount Upmin::Engine => '/admin', as: 'admin'

    match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]
  end

  devise_for :users

  resources :articles, 	only: [:index, :update]
  resource :dashboard,  only: [:index]

  root 'dashboard#index'
end
