Rails.application.routes.draw do
  root to: redirect('/payments')

  resources :payments do
    collection do
      get :index, :show
    end
  end
end
