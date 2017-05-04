Feature:

  Scenario: Printing out the address and email
    Given I request a random user
    Then I get a 200 status code
    And response has an address
    And response has an email in the correct format

  Scenario: Retrieving posts
    Given I request a random user
    Then I get a 200 status code
    When I retrieve posts
    Then response has a valid id
    And response has a valid title
    And response has a valid body

  Scenario: Creating a post
    Given I amend an existing post with valid id
    Then I get a 200 status code
    When I retrieve the post
    Then I get a 200 status code
    And the message has been amended correctly

