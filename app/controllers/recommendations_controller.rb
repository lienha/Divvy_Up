class RecommendationsController < ApplicationController

  def index
    # binding.pry
    @tour = Tour.find(params[:tour_id])
  end

  def create
    binding.pry
    recommendation = Recommendation.new(recommendation_params)
    # recommendation.tour_id = params[:tour_id]
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
