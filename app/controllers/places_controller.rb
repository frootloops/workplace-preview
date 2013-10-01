class PlacesController < ApplicationController
  load_and_authorize_resource except: [:create]

  def index
  end

  def new
  end

  def create
    @place = Place.new(place_params) do |place|
      place.owner = current_user
    end

    if @place.save
      redirect_to places_path
    else
      render "new"
    end
  end

  def update
  end

  def destroy
    @place.destroy
    redirect_to :back
  end

  def edit
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :area, :opening_hours, :status_cd, :city_id)
  end
end
