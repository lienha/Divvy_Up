class CommentsController < ApplicationController
	respond_to :json, :xml, :html
  def create
    @poi = params[:poi_id]
    @comment = Comment.create(poi_id: @poi, user_id: current_user.id, text: strip_newlines)
    @curr_poi = Poi.find(@poi.to_i)
    comments = @curr_poi.comments.all
    # respond_with(@comment, location: '/pois/' + @poi + '/comments')
    respond_to do |format|
      format.js
    end
  end

  private
    def strip_newlines
      params[:comment][:text].gsub(/\n/," ").gsub(/\r/, "")
    end
end