class BuildingsController < ApplicationController
  def index
  end
  def new
    @building = Building.new
  end
  
  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to @building, notice: 'Building was successfully created.'
    else
      render 'new'
    end
  end

  def show
    @building = Building.find(params[:id])
  end

  def building_params
  params.require(:building).permit(:street_address, :city, :state, :postal_code, :description)
  end
end