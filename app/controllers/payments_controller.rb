class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def security_deposit
    @deposit = SecurityDeposit.find(params[:security_deposit_id])
    @payment = @deposit.build_payment(payment_amount: @deposit.deposit_amount)
  end

  def create_deposit_payment
    deposit = SecurityDeposit.find(params[:security_deposit])
    byebug
    payment = deposit.build_payment(payment_params)
    if payment.save!
      deposit_up = deposit.update!(deposit_status: :paid)
      byebug
      redirect_to property_booking_agreements_path(deposit.agreement.property, deposit.agreement.booking), notice: "Payment Succesfull"
    else
      render :security_deposit, status: :unprocessable_entity
    end
  end

  def rent
  end

  private
  def payment_params
    params.require(:payment).permit(:payment_amount).merge!({user_id: current_user.id, payment_date: Time.now, payment_status: :paid })
  end
end
