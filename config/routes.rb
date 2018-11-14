Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
  	resources :products
  	resources :line_items

  	get "/orders/:number", to: "orders#summary"
  end

  get "/", to: "products#index"
  get "/checkout/cart", to: "checkout#cart"
  get "/about", to: "pages#about"
end
