Rails.application.routes.draw do
  resource :albums,only: :index do
    get :pagenate,on: :member
    get :search_type,on: :member
    get :search_word,on: :member
  end
  root to: "albums#index"

end
