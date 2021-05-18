Rails.application.routes.draw do
  root 'lab_reports#index', as: 'home'


  resources :lab_reports do
    resources :marks
  end
end
