Then(/^there is a full kitty$/) do
  full_kitty_size = 3
  expect(page).to have_selector("#kitty .card", :count => full_kitty_size)
end
