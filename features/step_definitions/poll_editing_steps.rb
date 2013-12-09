Then(/^I should be able to edit it$/) do
  click_link "Edit"
  sleep 1
  current_path.should == edit_poll_path(@poll)
end
