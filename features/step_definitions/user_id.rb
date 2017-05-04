require_relative '../url_library'
include Test::Unit::Assertions

Given(/^I request a random user$/) do
  @url = URL_Library.new
  @response = RestClient.get @url.base_url + '/users'
  data = JSON.parse(@response.body)
  @user_id = data[0]['id']
end

Then(/^I get a (\d+) status code$/) do |arg|
  assert_equal(200, @response.code)
end

Then(/^response has an address$/) do
  data = JSON.parse(@response.body)
  assert_not_nil(data[0]['address'])
end

And(/^response has an email in the correct format$/) do
  data = JSON.parse(@response.body)
  data[0]['email'] =~ /\w+@\w+\.{1}[a-zA-Z]{2,}/
end

When(/^I retrieve posts$/) do
  @valid_id = @user_id.to_s
  @response = RestClient.get @url.base_url + '/users/' + @valid_id
  @response = RestClient.get @url.base_url + '/posts/' + @valid_id
end

And(/^response has a valid id$/) do
  step 'I retrieve posts'
  data = JSON.parse(@response.body)
  assert_not_nil(data['userId'])
end

And(/^response has a valid title$/) do
  step 'I retrieve posts'
  data = JSON.parse(@response.body)
  assert_not_nil(data['title'])
end

And(/^response has a valid body$/) do
  step 'I retrieve posts'
  data = JSON.parse(@response.body)
  assert_not_nil(data['body'])
end


Given(/^I amend an existing post with valid id$/) do
  step 'I request a random user'
  @valid_id = @user_id.to_s
  @title = 'I have added a title'
  @body = 'I have added a body'
  @response = RestClient.put @url.base_url + '/posts/' + '2', {:title => '123456',
                                                               :body => '123456'}
  puts @response
  puts @response.code
end

When(/^I retrieve the post$/) do
  @response = RestClient.get @url.base_url + '/posts/' + '2'
  puts @response
  puts @response.code
end