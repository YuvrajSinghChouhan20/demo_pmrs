class UserMailer < ApplicationMailer
  default from: "yuvrajsinghchouhan668@gmail.com"

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
