class Public::EventsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_parameter)
    redirect_to root_path
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    event = Event.find_by(id: params[:id])
    event.update(event_parameter)
    redirect_to event_path(event.id)
  end
  
  def destroy
    event = Event.find_by(id: params[:id])
    event.destroy(event_parameter)
    redirect_to events_path
  end
  
  private

  def event_parameter
    params.require(:event).permit(:title, :content, :start_time)
  end
end
