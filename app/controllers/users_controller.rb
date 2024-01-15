class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard, :approve_booking_request]
  before_action :property_belongs_to, only: [:approve_booking_request]

  def dashboard
    current_user
  end

  def approve_booking_request
    @booking = Booking.find(params[:booking_id])
    if @booking.update!(booking_status: :confirmed)
      @mail = UserMailer.with(user: @booking.user, property: @booking.property, booking: @booking ).booking_confirmation.deliver_later
      redirect_to property_bookings_path(@booking.property), notice: "Booking Approved "
    else
      redirect_to root_path, alert: "Booking not Approved"
    end
  end

  private
  def property_belongs_to
    property = Property.find_by(user_id: current_user.id)
    unless property && current_user.has_role?(:landlord)
      redirect_to root_path, notice: "You're not Authorised User"
      return
    end
  end
end
