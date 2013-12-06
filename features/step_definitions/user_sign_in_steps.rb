Given(/^I have an account$/) do
  step 'I register'
  click_button "Logout"
end

Then(/^I should be able to sign in$/) do
  visit '/users/sign_in'

  fill_in 'user_email', :with => @user.email
  fill_in 'user_password', :with => @user.password

  click_button "Sign in"
end
