class CountriesController < ApplicationController
  load_and_authorize_resource except: [:create]

  def index
  end

  def new
  end

  def create
    @country = Country.new country_params

    if @country.save
      redirect_to countries_path
    else
      render :new
    end
  end

  def update
    if @country.update_attributes country_params
      redirect_to countries_path
    else
      render :edit
    end
  end

  def destroy
    @country.destroy
    redirect_to :back
  end

  def edit
  end

  private

  def country_params
    params.require(:country).permit(:name)
  end
end
