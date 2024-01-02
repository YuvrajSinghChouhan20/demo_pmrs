Rails.application.routes.draw do
  root 'home#index'
  get "user/dashboard", to: "users#dashboard"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  resources :properties do
    resources :bookings, only: [:create] do
      post "/approve", to: "users#approve_booking_request"
    end
    get "/bookings", to: "bookings#show_property_bookings"
  end




  get "up" => "rails/health#show", as: :rails_health_check

end
