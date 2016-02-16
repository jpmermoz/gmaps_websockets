class Event < ApplicationRecord
  belongs_to :event_category

  validates  :lat, :lon, :description, presence: true

  before_save :set_default_event_category

  private

  	def set_default_event_category
  		self.event_category ||= EventCategory.find_by_key("low")
  	end
end