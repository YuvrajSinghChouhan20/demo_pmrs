class Agreement < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :booking
  has_one_attached :document_image, dependent: :destroy
  has_and_belongs_to_many :documents
  has_one :security_deposit

  # callbacks
  before_create :set_status
  after_update :set_tenant

  # validations
  enum agreement_status: { draft: 0, accepted: 1, canceled: 2, expired: 3, done: 5}


  def deposit_paid?
    self.security_deposit && self.security_deposit.paid?
  end

  private
  def set_status
    self.agreement_status = :draft
  end

  def set_tenant
    self.user.add_role :tenant
  end

end
