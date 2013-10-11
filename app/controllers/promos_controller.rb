class PromosController < ApplicationController
  load_and_authorize_resource except: [:create]

  def index
    @promos = Promo.actual
  end

  def new
  end

  def create
    @promo = Promo.new promo_params

    if @promo.save
      redirect_to promos_path
    else
      render :new
    end
  end

  def update
    if @promo.update promo_params
      redirect_to promos_path
    else
      render :edit
    end
  end

  def destroy
    @promo.destroy
    redirect_to promos_path
  end

  def edit
  end

  def show
  end

  private

  def promo_params
    params.require(:promo).permit(:title, :body, :start_at, :end_at)
  end
end
