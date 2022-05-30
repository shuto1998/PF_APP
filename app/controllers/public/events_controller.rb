class Public::EventsController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_customer, only: [:edit, :update,:destroy]
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
      redirect_to events_path
    else
      @events = current_customer.events
      render :index
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @customer = @event.customer
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

  def correct_customer
    @event = Event.find(params[:id])
    @customer = @event.user
    redirect_to(events_path) unless @customer == current_customer
  end
end
