class CommentsController < ApplicationController
	# content_type :json
  def create
    @poi = params[:poi_id]
    comment = Comment.create(poi_id: @poi, user_id: current_user.id, text: strip_newlines)
    curr_poi = Poi.find(@poi.to_i)
    comments = curr_poi.comments.all

    respond_to do |format|
      format.js
    end
    #   respond_to do |format|
    #   msg = { :status => "ok", :message => "Success!", :id => comment.id }
    #   format.json  { render :json => msg } # don't do msg.to_json
    #   end
		# head :ok
		# ajax
  end

  private
    def strip_newlines
      params[:comment][:text].gsub(/\n/," ").gsub(/\r/, "")
    end
end