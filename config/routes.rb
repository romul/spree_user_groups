Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :user_groups
  end

  match '/admin/user_groups/:id/pricing' => 'admin/userGroups#pricing', :as => 'user_group'
  match '/admin/products/:id/pricing' => 'admin/products#pricing', :as => 'admin_product_pricing'
end
