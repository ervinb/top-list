Then(/^I should be able to delete it$/) do
  find_link("Destroy").click
  page.driver.browser.switch_to.alert.accept

  page.should_not have_content  "nPoll"
end
