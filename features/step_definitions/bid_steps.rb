Then(/^there are no bids$/) do
  expect(page).to have_content("The highest bid is nothing.")
end

When(/^([^" ]*) passes their chance to bid$/) do |player|
  select("Pass", :from => "bid_or_pass")
  click_button("Submit")
end

Then(/^the cards must be thrown in$/) do
  expect(page).to have_content("Every player passed. The cards must be redealt.")
end

When(/^([^" ]*) bids (\d+)([^" ])$/) do |player, tricks_count, trump_suit|
  select("Bid", :from => "bid_or_pass")
  select(tricks_count, :from => "tricks_count")
  select(trump_suit, :from => "trump_suit")
  click_button("Submit")
end

Then(/^the highest bid is for ([^" ]*)$/) do |bid|
  expect(page).to have_content("The highest bid is #{bid}.")
end
