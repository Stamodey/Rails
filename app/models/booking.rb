class Booking < ApplicationRecord
  belongs_to :photographer
  belongs_to :client
  belongs_to :service
end
