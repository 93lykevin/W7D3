require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  background :each do
    visit new_user_path
  end
  
  scenario 'has a new user page' do
    expect(page).to have_content('Sign Up')
  end

  feature 'signing up a user' do
    scenario 'has fields for username and password' do 
       expect(page).to have_content('Username')
       expect(page).to have_content('Password')
    end
  end
end

