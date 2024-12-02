Feature: Create token

  Background:
    Given url baseUrl
    And path 'auth'

  @create_token_caller
  Scenario:
    * def requestBody = { "username": "admin", "password": "password123" }  
    And request requestBody
    When method post
    Then status 200

   Scenario: Print token
    * print "generalToken : ", generalToken