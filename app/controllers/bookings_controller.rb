class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]

  def index
    @property = Property.find(params[:property_id])
    @bookings = @property.bookings #.where('booking_status != ?', "approved")
  end

  def create
    @property = Property.find(params[:property_id]);

    if @property.user == current_user
      redirect_to property_path(@property), alert: "You can't book your property"
      return
    end

    if @property.is_already_booked?(current_user)
      redirect_to property_path(@property), alert: "Property Already Booked"
      return
    end
    property_booking = {booking_date: Date.today, booking_for: @property.listed_for, user: current_user }
    @booking = @property.bookings.build(property_booking)

    if @booking.save!
      redirect_to property_path(@property), notice: "Booking succesfully"
    else
      redirect_to properties_path, alert: "Booking is fulled"
    end
  end

  def cancel_booking
    @booking = Booking.find(params[:booking_id])

    if @booking.update(booking_status: :canceled)
      redirect_to "#{property_path(property.id)}/bookings", booking_cancled_notice: "Booking cancled"
    else
      redirect_to "#{property_path(property.id)}/bookings", booking_error_notice: "Something went wrong"
    end
  end
end
