Feature: GET API Feature
  Scenario: get users details
    Given url 'https://gorest.co.in/public/v1/users'
    And path '30'
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse
    * def actName = jsonResponse.data.name
    * def actID = jsonResponse.data.id
    * def actEmail = jsonResponse.data.email
    * print actName
    * print actID
    * print actEmail
    * match actName == 'Mina Khatri'

  Scenario: get users details - user not found
    Given url 'https://gorest.co.in/public/v1/users'
    And path '1667'
    When method GET
    Then status 404
    * print response
