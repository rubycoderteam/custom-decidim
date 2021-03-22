Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  mount Decidim::Core::Engine => '/'

  Decidim::Admin::Engine.routes.draw do
  	constraints(->(request) { Decidim::Admin::OrganizationDashboardConstraint.new(request).matches? }) do
  		resources :subscription, only: [:index]
  	end
  end	

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
