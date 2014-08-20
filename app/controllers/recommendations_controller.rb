class RecommendationsController < ApplicationController

  def index
    @tour = Tour.find(params[:tour_id])
  end

  def create
    recommendation = Recommendation.new(recommendation_params)
    recommendation.user_id = current_user.id

    if recommendation.save
      redirect_to  "/tours/#{params[:tour_id]}/recommendations"
    end
  end

  private
  def recommendation_params
    params.require(:recommendation).permit(:text, :tour_id)
  end
end 
