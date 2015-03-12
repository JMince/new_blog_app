require 'rails_helper'


feature 'authentication' do

    scenario 'user can sign up' do
     visit root_path
     click_on 'Sign up'

     expect(page).to have_content("Sign Up Form")

     fill_in :email, with: "jeffrey@mince.com"
     fill_in :password, with: "password"
     fill_in :password_confirmation, with: "password"

     within ("form") {click_on 'Sign Up'}
     expect(current_path).to eq root_path
   end



end
