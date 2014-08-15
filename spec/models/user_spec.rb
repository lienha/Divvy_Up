require 'spec_helper'

describe User do
  context "with valid information should.." do
    before(:each) do
      @user = User.new(email: "david@david.com", password: "divvyup", username: "david", password_confirmation: "divvyup")
    end

    it 'can be saved' do
      expect(@user.save).to be true
    end
    describe "user email" do
      it 'must be present' do
        expect(@user.email = nil).to raise_error
      end
      it 'must be valid' do
        expect(@user.email = "sldafjlasdkf").to raise_error
      end
      it 'must be unique' do
        second_user = @user.dup
        @user.save
        expect(second_user.save).to be false
      end
    end

    describe "username" do
      it "must be present" do
        expect(@user.username = nil).to raise_error
      end
      it 'must be longer and 2 letters' do
        expect(@user.username = "hi").to raise_error
      end
      it 'must be shorter or equal to 16 letters' do
        expect(@user.username="1234567890123456").to raise_error
      end
    end

    describe "password" do
      it "must be present" do
        expect(@user.password = "").to raise_error
      end
      it "must be longer than 6 letters" do
        expect(@user.password = "12345").to raise_error
      end
    end

    describe "authenticate" do
      before{@user.save}
      let(:found_user){User.find_by(email: @user.email)}
      it 'returns user with a valid password' do
        expect(found_user.authenticate(@user.password)).to eq(@user)
      end
      it 'returns an error with an invalid password' do
        expect(found_user.authenticate('hello')).to be false
      end
    end
  end

  describe 'should have many ..' do
    it 'comments' do
      comments = User.reflect_on_association(:comments)
      comments.macro.should == :has_many
    end

    it 'tours' do
      tours = User.reflect_on_association(:tours)
      tours.macro.should == :has_many
    end
  end
end
