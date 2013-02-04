Feature: Browsing
  Because I write totally awesome posts
  An everyday Joe
  Should be able to read and comment on my posts

  Scenario: browsing the archive, to find more content to read
    Given there is at least one post titled "Test Post"
    When I go to the home page
    And I follow "Archives"
    Then I should see "Test Post"

  Scenario: adding a comment should fail if not logged in
    Given there is at least one post titled "Test Post"
    And I am on the "Test Post" page
    Then I should not be able to comment

  Scenario: adding a comment should succeed when logged in
    Given there is at least one post titled "Test Post"
    And I am logged in as "Test User"
    Then I should be able to comment

