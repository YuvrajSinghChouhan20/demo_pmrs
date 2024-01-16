class User < ApplicationRecord
  rolify
  has_many :properties, after_add: :add_landlord # ========== association applies when user has role landlord
  has_many :agreements #, after_add: :add_tenant # ========== When user has role tenant

  has_many :bookings, dependent: :destroy
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  # has_many_attached :documents
  has_many :reviews
  has_many :documents
  #  ===================== Valdations starts here ==============================
  validates :mobile, length: { minimum: 10 }

  def full_name
    self.first_name + " " + self.last_name
  end

  def pending_agreements?
    self.agreements.where(agreement_status: :draft)
  end

  def rented_properties
    self.agreements.where(agreement_status: :done).map{|agreement| agreement.property }
  end

  private
  def is_landlord?
    has_role? (:landlord)
  end

  def is_tenant?
    has_role? :tenent
  end

  def add_landlord(property)
    add_role(:landlord, property)
    add_role :landlord
  end

  def add_tenant(agreement)
    add_role(:tenant, agreement.property)
    add_role :tenant
  end
end
