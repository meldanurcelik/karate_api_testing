Feature: Create booking Caller

  Background:
    Given url baseUrl
    And path 'booking'
    And header Accept = 'application/json'

    @create_booking_caller
  Scenario: Create Booking
    * def requestBody = read('classpath:examples/restful-booker/model/createUpdateBooking.json')
    And request requestBody
    When method post
    Then status 200