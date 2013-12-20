When(/^I lock down the poll$/) do
  step 'I should be able to lock it down'
end

Then(/^I should be able to invite others$/) do
  click_button "Invite participants"
  fill_in "participant-email", :with => "friend@gmail.com"
  click_button "Send invitations"
  page.should have_content("Invitations sent!")
end
