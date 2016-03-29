CURRENT_PLAYER_TOKEN = "✪"

Given(/^I am on the index page$/) do
  visit("/")
end

When(/^I click on "([^"]*)"$/) do |link_text|
  click_on(link_text)
end

Then(/^I see (\d+) cards$/) do |number_of_cards|
  expect(page).to have_selector("li.card", count: number_of_cards)
end

Then(/^I see (\d+) hands$/) do |number_of_hands|
  expect(page).to have_selector(".hand", count: number_of_hands)
end

Then(/^I see the kitty$/) do
  expect(page).to have_selector("#kitty", count: 1)
end

Then(/^I see the current player token$/) do
  expect(page).to have_content(CURRENT_PLAYER_TOKEN, count: 1)
end

Then(/^I see the bid submission form$/) do
  expect(page).to have_selector("#bid_submission_form", count: 1)
end
