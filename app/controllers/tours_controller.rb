class ToursController < ApplicationController
	def index
		render 'index'
	end
  
	def show
    @tour = Tour.find(params[:id])
		render 'show'
	end
end