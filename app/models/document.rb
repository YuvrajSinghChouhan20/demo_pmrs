class Document < ApplicationRecord
  belongs_to :user
  has_one_attached :images
  has_and_belongs_to_many :agreements
end
