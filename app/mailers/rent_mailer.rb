class RentMailer < ApplicationMailer
  default from: "yuvrajsinghchouhan664@gmail.com"

  def rent_due_reminder
    @user = params[:user]
    @property = params[:property]

    mail(to: @user.email, property: @property, subject: "Rent Payment Reminder")
  end
end
