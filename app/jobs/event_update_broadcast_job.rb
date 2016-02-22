class EventUpdateBroadcastJob < ApplicationJob
  queue_as :default

  def perform(event)
  	ActionCable.server.broadcast 'events_update_channel', { event: event.as_json(include: :event_positions) }
  end
end
