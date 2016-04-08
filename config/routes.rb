Rails.application.routes.draw do
  resources :crypts

  root  'crypts#main'


end
