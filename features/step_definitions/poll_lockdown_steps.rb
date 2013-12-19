Then(/^I should be able to lock it down$/) do
  click_link "Show"
  click_button "Lock poll"
  page.should have_content("Poll locked!")
end
