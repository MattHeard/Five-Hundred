Then(/^there are (\d+) full hands of cards$/) do |hands_count|
  # A full hand has 10 cards, and therefore has a card which is both 10th and
  # last. The count of cards which are both 10th and last equals the number of
  # full hands.
  last_card_css_selector = ".card:nth-of-type(10):last-of-type"

  expect(page).to have_selector(last_card_css_selector, :count => hands_count)
end

Then(/^only (\d+) hand of cards is visible$/) do |hands_count|
  expect(page).to have_selector(".current_player_hand", :count => hands_count)
end
