Rails.application.routes.draw do
  get 'auto_car/index'
  root 'auto_car#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
