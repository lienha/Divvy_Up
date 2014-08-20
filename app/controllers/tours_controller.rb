class ToursController < ApplicationController
  def index
    @tours = Tour.all
    render 'index'
  end
  def show
    if Tour.find_by(id: params[:id])
      @tour = Tour.find(params[:id])
      @pois = @tour.pois
      render 'show'
    else
      render 'index'
    end
  end
end
