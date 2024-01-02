class BookingsController < ApplicationController
  before_action :check_user_signed_in?, only: [:create, :show_property_bookings, :update]

  def create
    user = current_user

    already_booked = Booking.find_by(user_id: current_user.id, property_id: params[:property_id])

    if already_booked
      redirect_to properties_path, notice: "property Already booked"
      return
    end
    @property = Property.find(params[:property_id]);
    property_booking = {
      booking_date: Date.today,
      booking_for: @property.listed_for,
      booking_status: "Pending",
      user_id: user.id
    }

    @booking = @property.bookings.create(property_booking);

    if @booking
      redirect_to properties_path, notice: "Booking succesfully"
    else
      redirect_to properties_path, notice: "Booking is fulled"
    end
  end

  def update
  end

  def show_property_bookings
    @property = Property.find(params[:property_id])
    @bookings = @property.bookings #.where('booking_status != ?', "approved")
  end

end
