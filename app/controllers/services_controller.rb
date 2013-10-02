class ServicesController < ApplicationController
  load_and_authorize_resource except: [:create]

  def new
  end

  def edit
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to services_path
    else
      render :new
    end
  end

  def update
    if @service.update(service_params)
      redirect_to services_path
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to services_url
  end

  private

  def service_params
    params.require(:service).permit(:profile, :name, :description)
  end
end
