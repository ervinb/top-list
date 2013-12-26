Given(/^I am on the home page$/) do
  visit root_path
end

When(/^I register$/) do
  @user = FactoryGirl.create(:user)
  register
end

Then(/^I should see a Create Poll button$/) do
  visit root_path
  page.should have_link 'New Poll'
end

def register
  click_link "Register"
  within ".container" do
    fill_in "user_email", :with => @user.email
    fill_in "user_password", :with => @user.password
    fill_in "user_password_confirmation", :with => @user.password
  end

  click_button "Sign up"
end
