When(/^I create a new poll MyPoll$/) do
  @poll = FactoryGirl.create(:poll)
  @poll.user = @user
  visit polls_path
end

Then(/^I should see MyPoll in my polls list$/) do
  page.should have_content "nPoll"
end
