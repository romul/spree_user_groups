Spree::Core::Engine.append_routes do
	namespace :admin do
		resources :user_groups do
			member do
				get :pricing
				patch :pricing
			end
		end
	end
end
