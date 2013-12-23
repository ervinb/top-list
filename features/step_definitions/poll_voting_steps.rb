Given(/^a poll is created$/) do

  @poll = FactoryGirl.create(:poll)
  entry_1 = FactoryGirl.create(:entry, :poll => @poll)
  entry_2 = FactoryGirl.create(:entry, :poll => @poll)

end

And(/^I am on the poll's page$/) do
  visit poll_path(@poll)
end

When(/^I vote on the poll$/) do
  click_button "Vote"
end

Then(/^I should see a success message$/) do
  page.should have_content "Voting successful!"
end
