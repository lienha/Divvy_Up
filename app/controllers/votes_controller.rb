  class VotesController < ApplicationController 
	  def create
	  	current_user
		    @recommendation = Recommendation.find(params[:recommendation_id])
		    @vote = Vote.create(user_id: current_user.id, recommendation_id: @recommendation.id, value: 1)
		    redirect_to "/tours/#{@recommendation.tour_id}/recommendations"
	  end 	
	  private
	  def vote_params
	    params.require(:vote).permit(:user_id, :recommendation_id, :value)
	  end	 
  end
