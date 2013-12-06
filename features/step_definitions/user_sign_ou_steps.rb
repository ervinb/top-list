Given(/^I am signed in$/) do
  step 'I register'
end

Then(/^I should be able to sign out$/) do
  click_button "Logout"
end
