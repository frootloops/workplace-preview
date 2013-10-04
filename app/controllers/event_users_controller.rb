class EventUsersController < ApplicationController
  load_and_authorize_resource :event
  load_and_authorize_resource :event_user, through: :event

  def index
  end

  def create
    @event.event_users.create(user: current_user)
    redirect_to @event
  end

  def destroy
    @event_user.destroy
    redirect_to @event
  end

end
