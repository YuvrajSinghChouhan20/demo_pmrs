class User < ApplicationRecord
  rolify
  has_many :properties if :landlord?

  has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :mobile, length: { minimum: 10}


  private
  def landlord?
    has_role?(:landlord)
  end
end
