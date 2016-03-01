Given(/^I am on the index page$/) do
  visit "/"
end

When(/^I click "([^"]*)"$/) do |link|
  click_link(link)
end
