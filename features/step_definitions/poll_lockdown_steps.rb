Then(/^I should be able to lock it down$/) do
  click_link "Edit"
  click_link "Lock poll"
  page.should have_content("Poll locked!")
end
