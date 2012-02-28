Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :user_groups
  end
end
