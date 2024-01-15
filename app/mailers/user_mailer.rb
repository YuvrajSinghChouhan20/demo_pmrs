class UserMailer < ApplicationMailer
  default from: "yuvrajsinghchouhan668@gmail.com"

  def booking_confirmation
    @user = params[:user]
    @property = params[:property]
    @booking = params[:booking]
    @url = "localhost:/user/dashboard"
    mail(to: @user.email, property: @property, subject: 'Booking Approved')
  end

  def agreement_created
    @user = params[:user]
    @property = params[:property]
    @agreement = params[:agreement]
    @url = "localhost:/user/dashboard"
    mail(to: @user.email, property: @property, agreement: @agreement , subject: 'Agreement')
  end
end
