When(/^I edit the poll$/) do
  visit edit_poll_path(@poll)
end

Then(/^I should be able to add items to the poll$/) do
  fill_in "poll_records_name", :with => "Item 1"
  click_button "Add record"

  page.should have_content "Item 1"
end
