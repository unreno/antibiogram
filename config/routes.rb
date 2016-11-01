Rails.application.routes.draw do
	resources :antibiograms do
		collection do
			post :import
			get :all
		end
	end

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root :to => "antibiograms#index"
end
