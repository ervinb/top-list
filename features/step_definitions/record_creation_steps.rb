When(/^I edit the poll$/) do
  visit edit_poll_path(@poll)
end

Then(/^I should be able to add items to the poll$/) do
  click_link "Add a record"
  find_field("Record").set("My Record")
  click_button('Update poll')
  debugger

  page.should have_content "My Record"
end
