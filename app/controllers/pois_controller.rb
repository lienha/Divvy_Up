class PoisController < ApplicationController
  def show
    @poi = Poi.find(params[:id])
    @comment = Comment.new
    render 'show'
  end
end
