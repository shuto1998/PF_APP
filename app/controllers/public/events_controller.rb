class Public::EventsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @events = current_customer.events
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_parameter)
    @event.customer_id = current_customer.id
    if @event.save
     redirect_to root_path
    else
      @events = current_customer.events
      render :index
    end
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
    event.destroy
    redirect_to events_path
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :content, :start_time)
  end
end
