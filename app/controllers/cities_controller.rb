class CitiesController < ApplicationController

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)
    @city.lon = "12.34"
    @city.lat = "54.32"

    if @city.save
      redirect_to cities_url
    else
      render action: 'new'
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city = City.find(params[:id])
    @city.destroy
    
    redirect_to cities_url
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name)
    end
end
