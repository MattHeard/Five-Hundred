Then(/^there is no trick$/) do
  expect(page).not_to have_selector("#trick")
end

Given(/^([^" ]*) won the first trick$/) do |player|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the trick is complete$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the trick is not complete$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^(\d+) trick(?:s?) (has|have) been played$/) do |tricks_count|
    pending # Write code here that turns the phrase above into concrete actions
end
