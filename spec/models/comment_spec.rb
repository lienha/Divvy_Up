require 'spec_helper'

describe Comment do
  before(:each) do
    @user = User.new(email: "david@david.com", password: "divvyup", username: "david", password_confirmation: "divvyup")
    @comment = Comment.new(text: "hello world", user: @user)
  end

  describe "length should.." do

    it 'be greater than 3' do
      @comment.text = "12"
      expect(@comment.save).to be false
    end
    it 'be less than 800' do
      @comment.text = "x" * 801
      expect(@comment.save).to be false
    end
  end

  describe "should have a user" do
    it 'belongs to a user' do
      comm = Comment.reflect_on_association(:user)
      comm.macro.should == :belongs_to
    end
    it 'cannot have a nil user' do
      @comment.user = nil
      expect(@comment.save).to be false
    end
  end

  describe "should have a point of interest" do
    it 'belongs to a point of interest' do
      comm = Comment.reflect_on_association(:poi)
      comm.macro.should == :belongs_to
    end
  end
end
