require 'rails_helper'


feature 'authentication' do

    scenario 'user can sign up' do
     visit root_path
     click_on 'Sign up'

     expect(page).to have_content("Sign Up Form")

     fill_in :user_email, with: "jeffrey@mince.com"
     fill_in :user_password, with: "user_password"
     fill_in :user_password_confirmation, with: "user_password"

     within ("form") {click_on 'Sign Up'}
     expect(current_path).to eq root_path
   end

   scenario 'User can log in' do

     user = User.create!(email: "george@jetson.com", password: "george", password_confirmation: "george")
     visit root_path
     click_on 'Sign In'
     expect(current_path).to eq sign_in_path
     expect(page).to have_content "Sign In"
     fill_in :user_email, with: user.email
     fill_in :user_password, with: user.password
     within("form") {click_on"Sign In"}
     expect(page).to have_content("Welcome #{user.email}")

   end



end
