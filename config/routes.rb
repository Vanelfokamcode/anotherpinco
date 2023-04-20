Rails.application.routes.draw do
  get 'carts/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 
  resources :products do
    resources :order_items
  end

  # user see ONE cart
  resource :cart

  get "info", to: "pages#info"

  root "pages#home"
end
