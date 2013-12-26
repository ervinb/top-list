Given(/^I am signed in$/) do
  @user = FactoryGirl.create(:user)

  sign_in @user
  page.should have_content(@user.email)
end

Then(/^I should be able to sign in$/) do
  step 'I am signed in'
end

def sign_in (user)
  visit new_user_session_path

  within "nav" do
    fill_in 'user_email', :with => user.email
    fill_in 'user_password', :with => user.password
  end

  click_button "Login"
end
