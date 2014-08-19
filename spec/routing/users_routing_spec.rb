require 'spec_helper'

RSpec.describe "routing to users", :type => :routing do
  it "routes user to signup form" do
    expect(get("/users/new")).
      to route_to("users#new")
  end

  it "routes user to signin form" do
    expect(get("/sessions/new")).
      to route_to("sessions#new")
  end

  it "does not expose a list of users" do
    expect(:get => "/users").not_to be_routable
  end

end