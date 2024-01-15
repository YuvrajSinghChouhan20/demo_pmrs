Rails.application.routes.draw do
  root 'home#index'
<<<<<<< Updated upstream
  get "user/dashboard", to: "users#dashboard"
=======

>>>>>>> Stashed changes
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
<<<<<<< Updated upstream
=======

  # namespace :user do
    get "/user/dashboard", to: "users#dashboard"
    get "/user/listings", to: "users#listings"
  # end

>>>>>>> Stashed changes
  resources :properties do
    resources :bookings, only: [:create, :index, :update] do
      resources :agreements, shallow: true, only: [:new, :create, :edit, :update, :destory]
      patch "/cancel", to: "bookings#cancel_booking"
      post "/approve", to: "users#approve_booking_request"
    end
    resources :reviews, only: [:index, :show, :create, :new]
  end

  get "/security_deposit/:security_deposit/payment", to: "payments#security_deposit", as: :new_deposit_payment
  post "security_deposit/:security_deposit/payments", to: "payments#create_deposit_payment", as: :deposit_payments

  get "/rent/:rent_id/payment", to: "payments#rent_payment", as: :new_rent_payment
  post "/rent/:rent_id/payment", to: "payments#create_rent_payment", as: :rent_payments

  get "up" => "rails/health#show", as: :rails_health_check
end
