Feature: Greeting a user

  Scenario: User is greeted by name
    Given the user is named "Alice"
    When I greet the user
    Then I should see "Hello, Alice!"
