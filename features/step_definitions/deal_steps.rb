Then(/^I see (\d+) cards dealt to me$/) do |arg1|
  expect(page).to have_selector("li", count: 10)
end
