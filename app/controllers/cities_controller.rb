class CitiesController < ApplicationController

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all

    if request.xhr?
      render :layout => false
    end
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)
    fetch_coordinates

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

  def index_with_ajax
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name)
    end

    def fetch_coordinates
      base_url = 'http://nominatim.openstreetmap.org/search'
      location = HTTParty.get(base_url, :query => { :q => @city.name, :format => 'json' })[0]
      @city.lat = location["lat"]
      @city.lon = location["lon"]
    end
end
