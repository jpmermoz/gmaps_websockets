# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class EventsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "events_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
