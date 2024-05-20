class EventsController < ApplicationController

    before_action :set_event , :only=>[:show, :edit, :update, :destroy]

    # GET /events/index
    # GET /events
    def index
        @events = Event.page(params[:page]).per(10)
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

        if @event.save
            flash[:notice] = "新增成功"
            redirect_to :action => :index # http 303
        else
            render :action => :new #new.html.erb
        end
    end

    # GET /events/edit/id
    def edit
    end

    # POST /events/update/:id
    def update

        if @event.update(event_pararms)
            flash[:notice] = "編輯成功"
            redirect_to :action => :show, :id =>@event
        else
            render :action => :edit #edit.html.erb
        end
    end

    # GET /events/destroy/:id
    def destroy
        @event.destroy
        flash[:alert] = "刪除成功"
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
