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

    # attachment_url = url_for(@property.agreements.last.document)
    # attachments['attached_file.pdf'] = @property.agreements.last.document.download

    mail(to: @user.email, property: @property, agreement: @agreement , subject: 'Agreement')
  end
end
