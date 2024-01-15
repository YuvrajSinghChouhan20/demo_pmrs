class AgreementsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_agreement, only: [:edit, :update]
  before_action :set_booking, only: [:new, :create]
  # before_action :check_already_created_agreement, only: [:edit, :new]

  def create
    property = @booking&.property
    user = @booking&.user
    # ========== if agreement already created between current user and property
    if property.agreement_already_created?(user)
      redirect_to property_bookings_path(property), notice: "Already Created"
      return
    end
    agreement = property.agreements.build(agreement_params)
    if agreement.save!
      @mail = UserMailer.with(user: user, property: property, agreement: agreement).agreement_created.deliver_later
      redirect_to property_bookings_path(property), notice: "Agreement Created and Mailed Succesfully"
    else
      redirect_to property_bookings_path(property), alert: "Agreement not created"
    end
  end

  def update
    @deposit = @agreement.build_security_deposit(deposit_amount: @agreement.security_amount, deposit_status: :processing)
    @deposit.save!
    if initialize_payment(@deposit)
      document_aadhar = create_document(:aadhar, @agreement.user)
      document_pan = create_document(:pancard, @agreement.user)
      document_signature = create_document(:signature, @agreement.user)
      @agreement.documents << document_aadhar << document_signature
<<<<<<< Updated upstream
      if agreement.update(agreement_status: :done)
=======

      if @agreement.update(agreement_status: :done)
        @agreement.property.update(property_status: :rented)
>>>>>>> Stashed changes
        redirect_to user_dashboard_path(@agreement.user), notice: "Agreement accepted"
        return
      end
    end
  end

  private
  def agreement_params
    user = @booking.user
    params[:agreement][:terms_and_conditions] = params[:agreement][:terms_and_conditions].split("\n")
    params.require(:agreement).permit(:duration, :start_date, :end_date, :amount, :agreement_status, :security_amount, :maintance_amount, :user_id, terms_and_conditions:[], documents:[]).merge!({user: user, booking_id: @booking.id})
  end

  def set_agreement
    @agreement = Agreement.find(params[:id])
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def create_document(document_type, documents_user)
    Document.create(document_name: document_type, user: documents_user, images: params[:agreement][:documents][document_type])
    # documents_user.documents.create(document_name: document_type, images: params[:agreement][:documents][document_type])
  end

  def initialize_payment(deposit)
<<<<<<< Updated upstream
    payment = deposit.build_payment(payment_amout: deposit.deposit_amount, user_id: current_user.id, payment_date: Time.now, payment_status: :paid )
=======
    payment = deposit.build_payment(payment_amount: deposit.deposit_amount, user_id: current_user.id, payment_date: Time.now, payment_status: :paid )
>>>>>>> Stashed changes
    if payment.save!
      deposit_up = deposit.update!(deposit_status: :paid)
      return true
    end
    false
  end

  def check_already_created_agreement
    redirect_to Something_path
  end
end
