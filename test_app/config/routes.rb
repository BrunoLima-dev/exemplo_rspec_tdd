Rails.application.routes.draw do
  devise_for :menbers
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
