class WelcomeController < ApplicationController
  def index
    render 'index'
  end

  def howitworks
    render "howitworks"
  end

end
