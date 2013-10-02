class CitiesController < ApplicationController
  load_and_authorize_resource except: [:create]

  def index
  end

  def new
  end

  def create
    @city = City.new city_params

    if @city.save
      redirect_to cities_path
    else
      render :new
    end
  end

  def update
    if @city.update_attributes city_params
      redirect_to cities_path
    else
      render :edit
    end
  end

  def destroy
    @city.destroy
    redirect_to :back
  end

  def edit
  end

  private

  def city_params
    params.require(:city).permit(:name, :country_id)
  end
end
