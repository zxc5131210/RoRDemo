class EventsController < ApplicationController

    before_action :set_event , :only=>[:show, :edit, :update, :destroy]

    # GET /events/index
    # GET /events
    def index
        @events = Event.all
    end

    #ET /events/show
    def show
        @page_title = @event.name
    end

    # GET /events/new
    def new
        @event = Event.new
    end

    # POST /events/create
    def create
        @event = Event.new(event_pararms)

        @event.save

        redirect_to :action => :index # http 303
    end

    # GET /events/edit/id
    def edit
    end

    # POST /events/update/:id
    def update
        @event.update(event_pararms)

        redirect_to :action => :show, :id => @event
    end

    # GET /events/destroy/:id
    def destroy
        @event.destroy

        redirect_to :action => :index
    end

    private

    def set_event
        @event = Event.find(params[:id])
    end

    def event_pararms
        params.require(:event).permit(:name, :description)
    end
end
