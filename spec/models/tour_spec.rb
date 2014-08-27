require 'spec_helper'

describe Tour do
  before(:each) do
    @user = User.new(email: "david@david.com", password: "divvyup", username: "david", password_confirmation: "divvyup")
    @tour = Tour.new(creator: @user, name: "The Walk of Shame", lat:41.8337329, lng:-87.7321555)
    @poi = Poi.new( name: "Dev Bootcamp", description: "Learn programming", lat:41.889911, lng:-87.637657, image: "dbc.jpg")
  end

  describe 'name should..' do
    it 'be provided' do
      @tour.name = nil
      expect(@tour.save).to be false
    end
    it 'be shorter than 21 letters' do
      @tour.name = 'x' * 21
      expect(@tour.save).to be false
    end
    it 'be longer than 2 letters' do
      @tour.name = 'x'
      expect(@tour.save).to be false
    end
  end

  describe 'center location should..' do
    it 'be mandatory' do
      @tour.lat = nil
      expect(@tour.save).to be false
    end
    it 'be in the form of json after save' do
      @tour.save
      expect(@tour.lat).to eq 41.8337329
    end
  end

  describe 'creator should... ' do
    it 'must be present' do
      @tour.creator = nil
      expect(@tour.save).to be false
    end
    it 'be related to its tour' do
      tour = Tour.reflect_on_association(:creator)
      tour.macro.should == :belongs_to
    end
  end

  describe 'pois...' do
    it 'can be multiple' do
      poi = Tour.reflect_on_association(:pois)
      poi.macro.should == :has_many
    end
  end

  describe 'comments' do
    it 'should be from pois' do
      comments = Tour.reflect_on_association(:comments)
      comments.macro.should == :has_many
      comments.options[:through].should == :pois
    end
  end

end
