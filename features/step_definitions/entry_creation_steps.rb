When(/^I edit the poll$/) do
  visit edit_poll_path(@poll)
end

Then(/^I should be able to add items to the poll$/) do
  click_link "Add an entry"
  find_field("Entry").set("My Entry")
  click_button('Update poll')

  page.should have_content "My Entry"
end
