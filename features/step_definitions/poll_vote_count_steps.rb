Given(/^I invite others to my poll$/) do
  step 'I lock down the poll'
  step 'I should be able to invite others'
end

Then(/^I should see the number of invites and votes on the list$/) do
  page.should have_content "Invitations"
  page.should have_content "Votes"
end
