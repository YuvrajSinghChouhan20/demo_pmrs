class PaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_deposit, only: [:security_deposit, :create_deposit_payment]

  def security_deposit
    @payment = @deposit.build_payment(payment_amount: @deposit.deposit_amount)
  end

  def create_deposit_payment
    payment = @deposit.build_payment(payment_params)
    if payment.save!
      deposit_up = @deposit.update!(deposit_status: :paid)
      redirect_to property_booking_agreements_path(@deposit.agreement.property, @deposit.agreement.booking), notice: "Payment Succesfull"
    else
      render :security_deposit, status: :unprocessable_entity
    end
  end

  private
  def payment_params
    params.require(:payment).permit(:payment_amount).merge!({user_id: current_user.id, payment_date: Time.now, payment_status: :paid })
  end

  def set_deposit
    @deposit = SecurityDeposit.find(params[:security_deposit])
  end
end
