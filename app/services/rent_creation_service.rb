class RentCreationService
  def initialize(user, agreement)
    @user = user
    @agreement = agreement
  end

  def create_monthly_rent
    return if rent_already_paid?
    rent_amount = calculate_monthly_rent
    due_date = calculate_due_date
    rent = rent_already_created? ? @agreement.rents.last : create_rent_record(rent_amount, due_date)
    rent
  end

  private
  def calculate_due_date
    date = Date.today
    year = date.year
    month = date.month
    day = @agreement.start_date.day
    Date.new(year, month, day);
  end

  def calculate_monthly_rent
    @agreement.amount
  end

  def create_rent_record(rent_amount,due_date)
    @agreement.rents.create(rent_amount: rent_amount, rent_status: :pending, due_date: due_date)
  end

  def rent_already_created?
    @agreement.rents.where(due_date: calculate_due_date).any?
  end

  def rent_already_paid?

  end
end




# =========================================== Old Code =======================================
# def create_monthly_rent
  #   rent_amount = calculate_monthly_rent
  #   due_date = calculate_due_date
  #   rent = rent_already_created? ? @agreement.rents.last : create_rent_record(rent_amount)
  #   send_rent_due_reminder(rent)
  #   rent
  # end

  # def calculate_due_date
  #   @agreement.rents.last.due_date + 1.months
  # end

  # def calculate_monthly_rent
  #   @agreement.amount
  # end

  # def create_rent_record(rent_amount,due_date)
  #   @agreement.rents.create(rent_amount: rent_amount, user_id: @user.id, rent_status: :pending, due_date: due_date)
  # end

  # def send_rent_due_reminder(user, due_date, rent)
  #   RentMailer.with(user: @user, property: @agreement.property, rent: rent).rent_due_reminder.deliver_later
  # end

  # def rent_already_created?
  #   @agreement.rents.where(due_date: calculate_due_date).any?
  # end