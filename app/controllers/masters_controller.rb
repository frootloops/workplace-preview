class MastersController < ApplicationController
  load_and_authorize_resource

  def show
    @services = @master.services
  end

  def index
  end

end
