Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "static#index"

  resources :static do
    collection do
      get :get_list
      get :xswqaz
      get :donate
      get :email
    end
  end

end