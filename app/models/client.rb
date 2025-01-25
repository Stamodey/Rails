class Client < ApplicationRecord
  has_many :bookings
  validates :name, :surname, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "некорректный формат" }
  validates :phone, uniqueness: true, allow_nil: true
  validates :email, uniqueness: true, allow_nil: true
end
