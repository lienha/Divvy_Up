class RecommendationsController < ApplicationController

  def index
    # binding.pry
    @tour = Tour.find(params[:tour_id])
  end

  def create
    recommendation = Recommendation.new(recommndation_params)
    recommendation.tour_id = params[:tour_id]
    recommendation.user_id = current_user.id

    if recommendation.save
      # @recomendations = Tour.find(params[:tour_id]).recommendations
      redirect_to  "/tours/#{params[:tour_id]}/recommendations"
    end
  end

  private
  def recommendation_params
    params.require(:recommendation).permit(:text)
  end
end
