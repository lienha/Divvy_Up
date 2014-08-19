class ToursController < ApplicationController
  def index
    @tours = Tour.all
    render 'index'
  end

  def show
    if Tour.find_by(id: params[:id])
      @tour = Tour.find(params[:id])
      @tour_center = JSON.parse(@tour.center, {symbolize_names: true})
      @pois = @tour.pois
      @location = []
      @pois.each do |x|
        @location << JSON.parse(x.location, {symbolize_names: true})
      end
      render 'show'
    else
      render 'index'
    end
  end
end
