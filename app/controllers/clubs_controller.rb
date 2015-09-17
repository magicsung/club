class ClubsController < ApplicationController

	before_action :set_event, :only => [ :show, :edit, :update, :destroy]

	def index
  		@events = Event.all
  		@events = Event.page(params[:page]).per(5)
	end

	def show
		@page_title = @event.name
	end

	def edit
	end

	def update
		flash[:notice] = "info was successfully updated"

  		if @event.update(event_params)
			redirect_to club_url(@event)
		else
			render :action => :edit
		end
	end

	def destroy
		flash[:alert] = "info was successfully deleted"

		@event.destroy

		redirect_to :action => :index
	end

	def new
		@event = Event.new
	end

	def create
		flash[:notice] = "info was successfully created"

		@event = Event.new(event_params)

		if @event.save
	    	redirect_to clubs_url
		else
	    	render :action => :new
	    end
	end


	private

	def event_params
		params.require(:event).permit(:name, :description)
	end

	def set_event
		@event = Event.find(params[:id])
	end

end
