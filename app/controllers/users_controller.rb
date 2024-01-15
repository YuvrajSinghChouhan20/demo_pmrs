class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard, :approve_booking_request]
  before_action :property_belongs_to, only: [:approve_booking_request]

  def listings
    @properties= current_user.properties
    respond_to do |format|
      format.html { render partial: 'users/listings', properties: current_user.properties, status: 200 }
      format.json { render json: render_to_string( partial: 'users/listings', properties: current_user.properties, layout: false), status: 200 }
      format.js
    end
  end

  def approve_booking_request
    @booking = Booking.find(params[:booking_id])
    if @booking.update!(booking_status: :confirmed)
      @mail = UserMailer.with(user: @booking.user, property: @booking.property, booking: @booking ).booking_confirmation.deliver_later
<<<<<<< Updated upstream
=======
      # unless @booking.property.agreements.where('agreement_status !=?', "active")

        # =========== Agreement created for rent ===================
        # @agreement = @booking.property.agreements.build(duration: " 11 months", start_date: Date.today, end_date: Date.today + 11.months, amount: 12, agreement_status: :draft, user_id: @booking.user.id);

        # @agreement_pdf = RentAgreementPdf.new(@booking.property.user, @booking.user, @booking.property) # generating pdf for the
        # @pdf = @agreement_pdf.generate

        # # @agreement.document.purge
        # @agreement.document.attach(io: StringIO.new(@pdf), filename: 'agreement.pdf', content_type: 'application/pdf')

        # if @agreement.save!
        # end
      # end

>>>>>>> Stashed changes
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
