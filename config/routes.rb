Spree::Core::Engine.routes.append do
  namespace :admin do
    resources :user_groups
  end
    match '/admin/user_groups/:id/pricing' => 'admin/userGroups#pricing', :as => 'user_group'
end
