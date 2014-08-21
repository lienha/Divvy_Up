  class VotesController < ApplicationController 
	  def create
		    @recommendation = Recommendation.find(params[:recommendation_id])
		    @vote = Vote.create(user_id: current_user.id, recommendation_id: @recommendation.id, value: 1) 
		    @sum = Vote.where(recommendation_id: @recommendation.id).sum("value")
		 	respond_to do |format|
		 		format.js
		 	end	    
	  end 	
	  private
	  def vote_params
	    params.require(:vote).permit(:user_id, :recommendation_id, :value)
	  end	 
  end
