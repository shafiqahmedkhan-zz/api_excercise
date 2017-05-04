Feature:

  Scenario: Getting a user_id and printing out the address and  email
    Given I request a random user
    Then I get a 200 status code
    And the address is received
    And the email format is correct