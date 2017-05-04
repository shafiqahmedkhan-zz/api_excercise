require_relative '../url_library'
require 'test/unit/assertions'
require 'test/unit'

Given(/^I request a random user$/) do
  url = URL_Library.new
  @response = RestClient.get url.base_url + '/users'
  data = JSON.parse(@response.body)
  puts  data[0]['id']
  @user_id = data[0]['id']
  #assert_equal(1, data['messages'][0]['message']['id'])
end

Then(/^I get a (\d+) status code$/) do |arg|
  assert_equal(200, @response.code)
end

Then(/^the address is received$/) do
  pending
end

And(/^the email format is correct$/) do
  pending
end