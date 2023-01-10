Rails.application.routes.draw do
  root to: redirect('/payments')
  resources :payments, only: %i[index show]
end
