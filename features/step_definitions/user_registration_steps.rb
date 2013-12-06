Given(/^I am on the home page$/) do
  visit root_path
end

When(/^I register$/) do
  @user = FactoryGirl.create(:user)
  sign_in
end

Then(/^I should see a Create Poll button$/) do
  visit root_path
  page.should have_link 'New Poll'
end

def sign_in
  click_button "Register"

  fill_in "user_email", :with => @user.email
  fill_in "user_password", :with => @user.password
  fill_in "user_password_confirmation", :with => @user.password

  click_button "Sign up"
end
