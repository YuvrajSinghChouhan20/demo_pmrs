class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show_property_bookings, :update]

  def create

    @property = Property.find(params[:property_id]);

    if @property.user == current_user
      redirect_to property_path(@property), alert: "You can't book your property"
      return
    end

    property_booking = {
      booking_date: Date.today,
      booking_for: @property.listed_for,
      booking_status: "pending",
      user_id: current_user.id
    }
    @booking = @property.bookings.find_or_create_by(property_booking);

    if @booking
      redirect_to property_path(@property), booking_notice: "Booking succesfully"
    else
      redirect_to properties_path, booking_notice: "Booking is fulled"
    end
  end

  def update
  end

  def cancel_booking
    @booking = Booking.find(params[:booking_id])

    if @booking.update(booking_status: :canceled)
      redirect_to "#{property_path(property.id)}/bookings", booking_cancled_notice: "Booking cancled"
    else
      redirect_to "#{property_path(property.id)}/bookings", booking_error_notice: "Something went wrong"
    end
  end

  def show_property_bookings
    @property = Property.find(params[:property_id])
    @bookings = @property.bookings #.where('booking_status != ?', "approved")
  end
end
