class CommentsController < ApplicationController

	def create
		current_user 
		@poi = Poi.find(params[:poi_id])
		@comment = @poi.comments.create(poi_id: @poi.id, user_id: current_user.id, text: params[:text])
		content_type :json 
		{id: @comment.id, status: 200}.to_json
		# head :ok 
		#ajax
	end	
end