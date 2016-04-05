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
  game = setup_game

  url = "/games/#{game.id}"
  visit(url)
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

Given(/^the dealer player is ([^"]*)$/) do |player|
  expect(page).to have_content("#{player.upcase} Ⓓ")
end

Then(/^the current player is ([^"]*)$/) do |player|
  expect(page).to have_content("#{player.upcase} ✪")
end

Then(/^West's hand is visible$/) do
  expect(page).to have_content("WEST ✪ 🂮 🂺 🃇 🂪 🃛 🃍 🂻 🃉 🂨 🃙")
end

Then(/^North's hand is not visible$/) do
  expect(page).to have_content("NORTH 🂠 🂠 🂠 🂠 🂠 🂠 🂠 🂠 🂠 🂠")
end

Then(/^East's hand is not visible$/) do
  expect(page).to have_content("EAST 🂠 🂠 🂠 🂠 🂠 🂠 🂠 🂠 🂠 🂠")
end

Then(/^South's hand is not visible$/) do
  expect(page).to have_content("SOUTH Ⓓ 🂠 🂠 🂠 🂠 🂠 🂠 🂠 🂠 🂠 🂠")
end

When(/^West bids 6♠$/) do
  bid
end

When(/^all players bid or pass$/) do
  bid
  pass_bid
  pass_bid
  pass_bid
end

Then(/^the current player's cards are links$/) do
  expect(page).to have_selector(".current_player_hand > .card > a")
end

Then(/^the non\-current players' cards are not links$/) do
  expect(page).not_to have_selector(".other_hand > .card > a")
end

When(/^the King of Spades is clicked$/) do
  click_link("🂮")
end

Then(/^the King of Spades is in the trick$/) do
  expect(page).to have_selector("#trick > #K♠")
end

When(/^all players play a card$/) do
  click_link("🂮")
  click_link("🃑")
  click_link("🂴")
  click_link("🂡")
end

Then(/^no cards are links$/) do
  expect(page).not_to have_selector(".card > a")
end

Then(/^the trick has (\d+) cards$/) do |number_of_cards|
  expect(page).to have_selector("#trick > .card", count: number_of_cards)
end

Then(/^South won the trick$/) do
  expect(page).to have_content("South won the trick!")
end

Then(/^North\-South has (\d+) trick(?:s)?$/) do |trick_count|
  expect(find(".scores > .trick .north-south").text).to eq trick_count
end

Then(/^West\-East has (\d+) trick(?:s)?$/) do |trick_count|
  expect(find(".scores > .trick .west-east").text).to eq trick_count
end

Then(/^there is a "([^"]*)" link$/) do |link_text|
  expect(page).to have_content(link_text)
end

When(/^I click "([^"]*)"$/) do |link_text|
  click_link(link_text)
end

When(/^all cards are played$/) do
  %w{ 
    K♠ A♣ 4♥ A♠ Continue
    10♥ 5♥ 5♦ Q♥ Continue
    7♦ 5♠ J♠ 6♥ Continue
    10♠ A♥ 8♣ Q♣ Continue
    J♣ 6♠ 5♣ K♣ Continue
    Q♦ 10♦ 10♣ 4♦ Continue
    J♥ K♥ Q♠ 6♦ Continue
    9♦ 8♦ 9♠ 8♥ Continue
    8♠ 9♥ 6♣ 7♥ Continue
    9♣ 7♣ JOKER K♦ Continue
  }.each { |link_text| click_on(unicode_card(link_text) || link_text) }
end

def bid
  select("Bid", :from => "bid_or_pass")
  select("6", :from => "number_of_tricks")
  select("♠", :from => "trump_suit")
  click_button("Submit")
end

def pass_bid
  select("Pass", :from => "bid_or_pass")
  click_button("Submit")
end

def setup_game
  game = Game.create!
  deal_cards(game)
  dealer_seat = :south
  set_dealer(game, dealer_seat)

  game
end

def deal_cards(game)
  deck = %w{
    A♣ 5♥ 5♠
    A♠ Q♥ 6♥
    4♥ 5♦ J♠
    K♠ 10♥ 7♦
    7♠
    A♥ 6♠ 10♦ K♥
    Q♣ K♣ 4♦ 6♦
    8♣ 5♣ 10♣ Q♠
    10♠ J♣ Q♦ J♥
    A♦
    8♦ 9♥ 7♣
    8♥ 7♥ K♦
    9♠ 6♣ JOKER
    9♦ 8♠ 9♣
    J♦
  }
  card_recipients = %i{
    north north north
    south south south
    east east east
    west west west
    kitty

    north north north north
    south south south south
    east east east east
    west west west west
    kitty

    north north north
    south south south
    east east east
    west west west
    kitty
  }
  deck.each_with_index do |card, index|
    player_seat = card_recipients[index]
    CardDealt.create!(card: card, player_seat: player_seat, game: game)
  end
end

def set_dealer(game, player_seat)
  DealerChanged.create!(player_seat: player_seat, game: game)
end

def unicode_card(name)
  {
    "BACK" => "🂠", "JOKER" => "🃟",

    "A♠" => "🂡", "K♠" => "🂮", "Q♠" => "🂭", "J♠" => "🂫", "10♠" => "🂪",
    "9♠" => "🂩", "8♠" => "🂨", "7♠" => "🂧", "6♠" => "🂦", "5♠" => "🂥",

    "A♣" => "🃑", "K♣" => "🃞", "Q♣" => "🃝", "J♣" => "🃛", "10♣" => "🃚",
    "9♣" => "🃙", "8♣" => "🃘", "7♣" => "🃗", "6♣" => "🃖", "5♣" => "🃕",

    "A♥" => "🂱", "K♥" => "🂾", "Q♥" => "🂽", "J♥" => "🂻", "10♥" => "🂺",
    "9♥" => "🂹", "8♥" => "🂸", "7♥" => "🂷", "6♥" => "🂶", "5♥" => "🂵",
    "4♥" => "🂴",

    "A♦" => "🃁", "K♦" => "🃎", "Q♦" => "🃍", "J♦" => "🃋", "10♦" => "🃊",
    "9♦" => "🃉", "8♦" => "🃈", "7♦" => "🃇", "6♦" => "🃆", "5♦" => "🃅",
    "4♦" => "🃄"
  }[name]
end
