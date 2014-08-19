require 'spec_helper'

RSpec.describe "routing to pois", :type => :routing do
  it "routes to a specific poi" do
    expect(get("/pois/1")).
      to route_to(
        :controller => "pois",
        :action => "show",
        :id => "1")
  end

  it "does not expose a list of pois" do
    expect(:get => "/pois").not_to be_routable
  end

end