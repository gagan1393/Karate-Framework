Feature: Create user using put api

  Background:
    * url 'https://gorest.co.in'
    * def requestPayload =
	"""
	{
        "status": "inactive"
    }
	"""
  Scenario: Update a user with the given data
    Given path '/public/v2/users/102'
    And request requestPayload
    And header Authorization = 'Bearer ' + '0995b1a23d0969e0e6c23bcee55c72e0daf0cc917e6ce8162ed65aabebbf2c72'
    When method put
    Then status 200
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'Mr. Ambar Dhawan'
    #And match $.data.email == requestPayload.email