require 'spec_helper'

describe Poi do
  before(:each) do
    @user = User.new(email: "david@david.com", password: "divvyup", username: "david", password_confirmation: "divvyup")
    @tour = Tour.new(creator: @user, name: "The Walk of Shame", lat:41.8337329, lng:-87.7321555)
    @poi = Poi.new( name: "Dev Bootcamp", description: "Learn programming",lat:41.889911, lng:-87.637657, image: "dbc.jpg")
  end

  describe "is related to a tour" do
    it 'and saves the tour' do
      @poi.tour = @tour
      expect(@poi.save).to be true
    end
    it 'and relationship is not optional' do
      @poi.tour = nil
      expect(@poi.save).to be false
    end
    it 'belongs to a tour' do
      poi = Poi.reflect_on_association(:tour)
      poi.macro.should == :belongs_to
    end
  end

  describe "has a location" do
    it 'that is not nil' do
      @poi.lat = nil
      expect(@poi.save).to be false
    end

    it 'as a json convertible string' do
      expect(@poi.lat).to eq 41.889911
    end
  end

  describe "has a description" do
    it 'that is longer than 5 words' do
      @poi.description = '1234'
      expect(@poi.save).to be false
    end
    it 'that is shorter than 2000 words' do
      @poi.description = "x" * 2001
      expect(@poi.save).to be false
    end
    it 'that must be provided' do
      @poi.description = nil
      expect(@poi.save).to be false
    end
  end

  describe 'image' do
    it 'should be present' do
      @poi.image = nil
      expect(@poi.save).to be false
    end
  end

end
