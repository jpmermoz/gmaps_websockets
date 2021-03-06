class EventsController < ApplicationController
	before_action :set_event, only: [:show, :update]

	def create
		@event = Event.new(event_params)
		
		if @event.save
			render :show, status: :created, location: @event
		else
			render json: @event.errors, status: :unprocessable_entity
		end
	end

	def update
		if @event.update(event_params)
      render :show, status: :ok, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
	end

	def show
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:description, :event_category_id, event_positions_attributes: [:id, :lat, :lng, :_destroy])
    end
end