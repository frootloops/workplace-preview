class EventsController < ApplicationController
  load_and_authorize_resource except: [:create]

  def index
  end

  def new
  end

  def create
    @event = Event.new event_params

    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def update
    if @event.update_attributes event_params
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to :back
  end

  def edit
  end

  private

  def event_params
    params.require(:event).permit!
  end
end
