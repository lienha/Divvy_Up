require 'spec_helper'

RSpec.describe "routing to tours", :type => :routing do
  it "routes to all tours" do
    expect(get("/tours")).
      to route_to("tours#index")
  end

  it "routes to a specific tour" do
    expect(get("/tours/1")).
      to route_to(
        :controller => "tours",
        :action => "show",
        :id => "1")
  end

  it "does not route to edit a tour" do
    expect(:get => "/tours/1/edit").not_to be_routable
  end
  
end