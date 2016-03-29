NEW_GAME_LINK_TEXT = "Start a new game"
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

Given(/^I have started a game$/) do
  visit("/")
  click_on(NEW_GAME_LINK_TEXT)
end

Given(/^there is a current player$/) do
  expect(page).to have_content(CURRENT_PLAYER_TOKEN, count: 1)
end

Then(/^the current player's hand is visible$/) do
  expect(page).to have_selector(".other_hand > .hidden")
  expect(page).not_to have_selector(".current_player_hand > .hidden")
end

Then(/^the hands of non-current players are hidden$/) do
  expect(page).to have_selector(".current_player_hand > .not_hidden")
  expect(page).not_to have_selector(".other_hand > .not_hidden")
end

Then(/^there is a ([^"]*) select field$/) do |field|
  expect(page).to have_selector("select##{field}")
end
