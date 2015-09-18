class ClubsController < ApplicationController

	before_action :set_event, :only => [ :show, :edit, :update, :destroy]

	def index
  		@events = Event.all
  		@events = Event.page(params[:page]).per(5)

  		if params[:edit]
  			@edit_event = Event.find(params[:edit])
  		end

  		if params[:new]
  			@new_event = Event.new  			
  		end
	end

	def show
		@page_title = @event.name
	end

	def edit
	end

	def update
		flash[:notice] = "info was successfully updated"

  		if @event.update(event_params)
			redirect_to clubs_url(@event, :page => params[:page] )
		else
			redirect_to clubs_url #:action => :edit
		end
	end

	def destroy
		flash[:alert] = "info was successfully deleted"

		@event.destroy

		redirect_to :back
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
		params.require(:event).permit(:name, :description, :hours, :rank)
	end

	def set_event
		@event = Event.find(params[:id])
	end

end
