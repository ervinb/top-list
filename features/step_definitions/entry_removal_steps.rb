Then(/^I should be able to remove items from the poll$/) do
  step "I should be able to add items to the poll"

  click_link "Edit"
  click_link "Remove"
  click_button "Update"

  page.should_not have_content("My Entry")
end
