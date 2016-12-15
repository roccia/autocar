Rails.application.routes.draw do
  get 'auto_car/index'
  root 'auto_car#index'
  get 'auto_car/move' => 'auto_car#move'
  get 'auto_car/stop' => 'auto_car#stop'
  get 'auto_car/back' => 'auto_car#back'
  get 'auto_car/speed' => 'auto_car#speed'
  get 'auto_car/left' => 'auto_car#left'
  get 'auto_car/right' => 'auto_car#right'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
