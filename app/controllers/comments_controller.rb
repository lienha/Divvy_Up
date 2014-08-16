class CommentsController < ApplicationController

	def create
		current_user #<--needed?
		@poi = Poi.find(params[:poi_id])
		@comment = @poi.comments.create(poi_id: @poi.id, user_id: current_user.id, text: params[:text])
		content_type :json 
		{id: @comment.id}.to_json
		head :ok 
		# redirect_to tour_poi_comments_path(@poi)
		#ajax
		#   content_type :json
  # {cell: rand(0..8),
  # 	color: "#" + "%06x" % (rand * 0xffffff)}.to_json
	end	
end