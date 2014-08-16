class PoisController < ApplicationController
	def show
		@poi = Poi.find(params[:poi_id])
		render 'show'
	end
end