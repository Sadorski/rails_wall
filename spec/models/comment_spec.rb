require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "With valid attributes" do 
    it "should save" do 
      expect(build(:comment)).to be_valid
    end 
  end
  context "with invalid attributes" do
    it "should not save if content being blank" do 
      expect(build(:comment, content: "")).to be_invalid
    end
    it "should not save if username is not specified" do 
      expect(build(:comment, user: build(:user, username:""))).to be_invalid
    end
    it "should not save if message is not specified" do
      expect(build(:comment, message: build(:message, content:""))).to be_invalid
    end
  end
end