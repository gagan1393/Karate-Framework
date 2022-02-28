Feature: Create user using post api with JSON file

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

    * def requestPayload = read('classpath:src/test/resources/payload/user.json')
    * requestPayload.email = randomString + "@gmail.com"
    * print requestPayload

  Scenario: Create a user with the given data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + '0995b1a23d0969e0e6c23bcee55c72e0daf0cc917e6ce8162ed65aabebbf2c72'
    When method post
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'Joe sib'
    And match $.data.email == requestPayload.email