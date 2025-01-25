class Photographer < ApplicationRecord
  has_many :bookings
  validates :name, :surname, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "некорректный формат" }
  validates :phone, uniqueness: true, allow_blank: true
  validates :email, uniqueness: true, allow_blank: true
end
