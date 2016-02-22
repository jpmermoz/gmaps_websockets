class EventCreateBroadcastJob < ApplicationJob
  queue_as :default

  def perform(event)
  	html_item = ActionView::Base.new(Rails.configuration.paths['app/views']).render(
		  partial: 'map/event_item', 
		  formats: [:html],
		  handlers: [:erb],
		  locals: { event: event }
		)
  	ActionCable.server.broadcast 'events_create_channel', { event: event.as_json(include: [:start_position, :event_positions]), html_item: html_item }
  end
end
