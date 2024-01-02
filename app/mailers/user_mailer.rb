class UserMailer < ApplicationMailer
  default from: "tenento@tenento.com"

  def booking_confirmation
    puts "================================"
    puts params
    puts "================================"
    @user = params[:user]
    @property = params[:property]
    @url = "localhost:/user/dashboard"
    mail(to: @user.email, property: @property , subject: 'Booking Approved')
  end
end
