class Event < ApplicationRecord
  belongs_to :event_category

  validates  :lat, :lon, :description, presence: true

  before_validation :set_default_event_category
  after_create_commit { EventBroadcastJob.perform_later(self) }

  private

  	def set_default_event_category
  		self.event_category_id ||= EventCategory.find_by_key("low").try(:id)
  	end
end