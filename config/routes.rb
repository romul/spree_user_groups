Spree::Core::Engine.append_routes do
  namespace :admin do
    resources :user_groups
  end
  match '/admin/user_groups/:id/pricing', to: 'admin/user_groups#pricing', via: [:get, :patch], :as => 'user_group'
end
