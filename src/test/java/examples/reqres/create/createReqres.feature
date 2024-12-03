Feature: Create Req Res Caller

  Background:
    Given url reqresBaseUrl
    And path 'api/users'
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def randomName = dataGenerator.generateRandomString(5)
    * def jsRandomName = call read('classpath:helpers/randomDataGenerator.js')
    * def name = karate.get('__arg.name',jsRandomName)
    * print "name:", name

    @create_reqres_caller
  Scenario: Crete Req Res
    * def requestBody = read('classpath:model/createReqres.json')
    * requestBody.name = name
    And request requestBody
    When method post
    Then status 201

