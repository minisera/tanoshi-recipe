Rails.application.routes.draw do
  resource :albums do
    get :pagenate,on: :member
    get :search,on: :member
  end
  root to: "albums#index"

end
