When(/^I lock down the poll$/) do
  step 'I should be able to lock it down'
end

Then(/^I should be able to invite others$/) do
  click_link "Invite participants"
  fill_in "Email", :with => "friend@gmail.com"
  click_button "Send"
  page.should have_content("Invitations sent!")
end
