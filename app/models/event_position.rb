class EventPosition < ApplicationRecord
  validates  :lat, :lng, presence: true
end
