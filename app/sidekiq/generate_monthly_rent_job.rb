class GenerateMonthlyRentJob
  include Sidekiq::Job

  def perform
    agreements = User.needs_to_pay_rent
    agreements.each do |agreement|
      user = agreement.user
      RentCreationService.new(user, agreement).create_monthly_rent
    end
  end
end
