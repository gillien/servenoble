Rails.application.routes.draw do
  devise_for :users

  authenticate :user, lambda { |u| u.persisted? } do
    mount Upmin::Engine => '/', as: "admin"
  end
end
