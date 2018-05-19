require 'rails helper'
#creating username
feature "User creates an account" do
    before(:each) do 
      visit new_user_path
    end
    scenario "Successfully create a user account" do
        fill_in "user_username", with: "token"
        click_button "Create User"
        expect(page).to have_content "Welcome, token"
        expect(page).to have_current_path(messages_path(messages#index))
    end
    scenario "unsuccessfully creates a new user account" do
        fill_in "user_username", with : "toke"
        click_button "Create User"
        expect(current_path).to eq(new_user_path)
        expect(page).to have_content "You username must be at least 5 characters"
    end