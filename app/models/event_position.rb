class EventPosition < ApplicationRecord
  validates  :lat, :lon, presence: true
end
