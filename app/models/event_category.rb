class EventCategory < ApplicationRecord
	validates :key, :name, :alert_duration, :color, presence: true
	validates :key, uniqueness: true
end
