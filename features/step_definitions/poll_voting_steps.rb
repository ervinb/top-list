Given(/^a poll is created$/) do

  @poll = FactoryGirl.create(:poll)
  record_1 = FactoryGirl.create(:record, :poll => @poll)
  record_2 = FactoryGirl.create(:record, :poll => @poll)

end

And(/^I am on the poll's page$/) do
  visit poll_path(@poll)
end

When(/^I vote on the poll$/) do
  click_button "Vote"
end

Then(/^I should see a success message$/) do

  within(:css, "#notice") do
    page.should have_content "Thanks for your participation!"
  end

end
