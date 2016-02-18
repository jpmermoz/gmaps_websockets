class MapController < ApplicationController

	def index
		@events = Event.order(created_at: :desc).limit(10)
	end
	
end
