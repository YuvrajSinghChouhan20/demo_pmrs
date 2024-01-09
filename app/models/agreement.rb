class Agreement < ApplicationRecord
  belongs_to :user
  belongs_to :property
  has_one_attached :document_image
  has_and_belongs_to_many :documents

  enum agreement_status: { draft: 0, accepted: 1, canceled: 2, expired: 3}

end
