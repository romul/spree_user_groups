Rails.application.routes.draw do
  namespace :admin do
    resources :user_groups
  end
end
