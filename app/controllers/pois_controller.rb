class PoisController < ApplicationController
	def show
		@poi = Poi.find(params[:id])
		render 'show'
	end
end