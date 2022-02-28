Feature: Create user using post api

  Background:
    * url 'https://gorest.co.in'
    * def random_string =
	"""
		function(s){
			var text = "";
			var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			for(var i=0; i<s; i++)
				text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
				return text;
		}
	"""
    * def randomString = random_string(10)
    * print randomString
    * def requestPayload =
	"""
	{
        "name": "Tom Cruise",
        "gender": "male",
        "status": "active"
    }
	"""
    * requestPayload.email = randomString + "@gmail.com"
    * print requestPayload

  Scenario: Update a user with the given data
    #create a user with Post call
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + '0995b1a23d0969e0e6c23bcee55c72e0daf0cc917e6ce8162ed65aabebbf2c72'
    When method post
    Then status 201
    And match $.data.id == '#present'

    #fetch the user id from the post call response
    * def userId = $.data.id
    * print userId

    #updating the user using put call api
    * def requestPutPayload =
	"""
	{
        "gender": "female",
        "status": "inactive"
    }
	"""
    * print requestPutPayload
    Given path '/public/v2/users/'+ userId
    And request requestPutPayload
    And header Authorization = 'Bearer ' + '0995b1a23d0969e0e6c23bcee55c72e0daf0cc917e6ce8162ed65aabebbf2c72'
    When method put
    Then status 200
    And match $.data.id == '#present'
    And match $.data.id == userId
    And match $.data.name == '#present'
    And match $.data.name == 'Tom Cruise'
    And match $.data.email == requestPutPayload.email