class AgreementsController < ApplicationController
  before_action :authenticate_user!
  def new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @property = Property.find(params[:property_id])
    @user = Booking.find(params[:booking_id]).user

    @agreement = @property.agreements.build(agreement_params.merge!(user_id: @user.id))
    if @agreement.save!
      retry_count = 3

      begin
        @mail = UserMailer.with(user: @user, property: @property, agreement: @agreement).agreement_created.deliver_later
      rescue
        retry_count = retry_count - 1
        retry if retry_count.positive?
        Rails.logger.error(" Error sending  Agreement Mail ")

        redirect_to "#{property_path(@property.id)}/bookings", notice: "Mail note sent"
        return
      end

      redirect_to "#{property_path(@property.id)}/bookings", notice: "Agreement Created and Mailed Succesfully"
    else
      redirect_to "#{property_path(@property.id)}/bookings", alert: "Agreement not created"
    end
  end

  def edit
    @agreement = Agreement.find(params[:id])
  end

  def update
    @agreement = Agreement.find(params[:id])
    if @agreement.update!(agreement_status: 1)
      document_aadhar = Document.find_or_create_by(document_name: 'aadhar_card', user_id: @agreement.user_id, images: params[:agreement][:documents][:aadhar_card])
      document_signature = Document.find_or_create_by(document_name: 'signature', user_id: @agreement.user_id, images: params[:agreement][:documents][:aadhar_card])
      @agreement.documents << document_aadhar
      @agreement.documents << document_signature

      redirect_to user_dashboard_path, agreement_accepted: "Agreement accepted"
    else
      redirect_to root_path, agreement_error: "Error in accepting agreement"
    end
  end

  def destroy
  end

  private

  def agreement_params
    params[:agreement].merge!(user_id: Booking.find(params[:booking_id]).user)
    params[:agreement][:terms_and_conditions] = params[:agreement][:terms_and_conditions].split("\n")
    params.require(:agreement).permit(:duration, :start_date, :end_date, :amount, :agreement_status, :security_deposit, :maintance_amount, :user_id, terms_and_conditions:[], documents:[])
  end


  def user_params
    params.require(:agreement).permit(terms_and_conditions:[], documents: [])
  end
end
