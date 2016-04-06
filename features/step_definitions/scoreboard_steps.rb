# TODO DRY
Then(/^there is an empty scoreboard$/) do
  expect(find(".scores .trick .north-south").text).to eq "0"
  expect(find(".scores .trick .west-east").text).to eq "0"
  expect(find(".scores .points .north-south").text).to eq "0"
  expect(find(".scores .points .west-east").text).to eq "0"
end
