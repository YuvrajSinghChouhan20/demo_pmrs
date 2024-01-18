class UserNeedsToPayRentJob
  include Sidekiq::Job

  def perform
    rents = Rent.pending_rents
    rents.each do |rent|
      @agreement = rent.agreement
      @user = @agreement.user
      RentMailer.with(user: @user, property: @agreement.property, rent: rent).rent_due_reminder.deliver_later
    end
  end
end
