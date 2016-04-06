Given(/^a player is on the index page$/) do
  index_page_url = "/"
  visit(index_page_url)
end

When(/^the new game link is clicked$/) do
  new_game_link_text = "Start a new game"
  click_on(new_game_link_text)
end
