Then(/^there are no bids$/) do
  expect(page).to have_content("The highest bid is nothing.")
end

When(/^([^" ]*) passes their chance to bid$/) do |player|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the cards must be thrown in$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^([^" ]*) bids (\d+)([^" ])$/) do |player, tricks_count, trump_suit|
  pending # Write code here that turns the phrase above into concrete actions
end
