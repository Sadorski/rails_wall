require 'rails_helper'

RSpec.describe Message, type: :model do
  context "With valid attributes" do 
    it "should save" do 
      expect(build(:message, content: "I will ask him")).to be_valid
    end 
  end
  context "with invalid attributes" do
    it "should not save if content being blank" do 
      expect(build(:message, content: "")).to be_invalid
    end
    it "should not save if content is less than 10 characters" do
      expect(build(:message)).to be_invalid
    end
    it "should not save if username is not specified" do 
      expect(build(:message, user: build(:user, username:""))).to be_invalid
    end
  end
end
