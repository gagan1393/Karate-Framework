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
        "name": "Adam",
        "gender": "male",
        "status": "active"
    }
	"""
    * requestPayload.email = randomString + "@gmail.com"
    * print requestPayload

  Scenario: Delete a user with the given data
    #1. create a user with Post call
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + '0995b1a23d0969e0e6c23bcee55c72e0daf0cc917e6ce8162ed65aabebbf2c72'
    When method post
    Then status 201
    And match $.data.id == '#present'

    #fetch the user id from the post call response
    * def userId = $.data.id
    * print userId
    #2. delete the same user
    Given path '/public/v1/users/' + userId
    And request requestPayload
    And header Authorization = 'Bearer ' + '0995b1a23d0969e0e6c23bcee55c72e0daf0cc917e6ce8162ed65aabebbf2c72'
    When method delete
    Then status 204

   # 3. get the same user with same
    Given path '/public/v1/users' + userId
    When method GET
    Then status 404
    And match $.data.message == 'Resource not found'
