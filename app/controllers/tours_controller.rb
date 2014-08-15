class ToursController < ApplicationController
	def index
    @tours = Tour.all
		render 'index'
	end
  
	def show
    
		render 'show'
	end
end