Then(/^there is no contract$/) do
  expect(page).not_to have_content("The contract is for")
end

Then(/^the contract is for ([^" ]*)$/) do |contract|
  expect(page).to have_content("The contract is for #{contract}")
end

Then(/^the contracting team is ([^" ]*)$/) do |team|
  expect(page).to have_content("The contracting team is #{team}")
end
