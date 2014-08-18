class CommentsController < ApplicationController
	# content_type :json

	def create
		@comment = Comment.create(poi_id: params[:poi_id], user_id: current_user.id, text: params[:comment][:text])
		# @comment.to_json
    # make this a json object
	    redirect_to (:back)
    # respond_to do |format|
      # msg = { :status => "ok", :message => "Success!", :id => comment.id }
      # format.json  { render :json => msg } # don't do msg.to_json
    # end
		# head :ok
		#ajax
	end
end