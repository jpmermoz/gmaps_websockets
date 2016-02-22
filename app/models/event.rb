class Event < ApplicationRecord
  belongs_to :event_category
  has_many   :event_positions, dependent: :destroy

  validates :description, :event_positions, presence: true
  before_validation :set_default_event_category

  accepts_nested_attributes_for :event_positions, allow_destroy: true

  after_create_commit { EventCreateBroadcastJob.perform_later(self) }
  after_update_commit { EventUpdateBroadcastJob.perform_later(self) }

  def start_position
  	self.event_positions.order(:created_at).first
  end

  private

  	def set_default_event_category
  		self.event_category_id ||= EventCategory.find_by_key("low").try(:id)
  	end
end