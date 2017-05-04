require_relative '../url_library'
include Test::Unit::Assertions

Given(/^I request a random user$/) do
  url = URL_Library.new
  @response = RestClient.get url.base_url + '/users'
  data = JSON.parse(@response.body)
  @user_id = data[0]['id']
end

Then(/^I get a (\d+) status code$/) do |arg|
  assert_equal(200, @response.code)
end

Then(/^the address is received$/) do
  data = JSON.parse(@response.body)
  assert_not_nil(data[0]['address'])
end

And(/^the email format is correct$/) do
  data = JSON.parse(@response.body)
  data[0]['email'] =~ /\w+@\w+\.{1}[a-zA-Z]{2,}/
end