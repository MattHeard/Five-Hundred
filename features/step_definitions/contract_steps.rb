Then(/^there is no contract$/) do
  expect(page).not_to have_content("The contract is for")
end

Then(/^the contract is for (\d+)([^" ])$/) do |tricks_count, trump_suit|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the contracting team is ([^" ]*)$/) do |team|
  pending # Write code here that turns the phrase above into concrete actions
end
