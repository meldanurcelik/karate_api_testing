Feature:

  Background:
    * def createReqRes = call read('classpath:examples/reqres/create/createReqres.feature@create_reqres_caller')
    * def id = createReqRes.response.id
    Given url reqresBaseUrl
    And path '/api/users', 2

    @update_req_res
  Scenario:
    #* def requestBody = createReqRes.requestBody
    * def requestBody = read('classpath:model/createReqres.json')
    * requestBody.job = 'Engineer'
    And request requestBody
    When method put
    Then status 200
    * print response