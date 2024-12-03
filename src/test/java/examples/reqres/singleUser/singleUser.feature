Feature: Get Req res Feature

  Background:
    * def nameFeature = 'kloia'
    * def createReqRes = call read('classpath:examples/reqres/create/createReqres.feature@create_reqres_caller')
    * def id = createReqRes.response.id
    Given url reqresBaseUrl

    @get_req_res
  Scenario Outline: Get req res
    And path '/api/users', <id>
    When method get
    Then status 200
    * print response
    Examples:
      | id |
      | 2  |
      | 3  |