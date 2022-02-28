Feature: GET API Feature with header
  Scenario: get pass the user request with header
#  Given url baseUrl
#  * print baseUrl
    Given header Content-Type = 'application/json; charset=utf-8'
    And header Accept-Encoding = 'gzip,deflate'
    And header Connection = 'Keep-Alive',
    And header Expect = '100-continue'
    And header User-Agent = 'PostmanRuntime/7.28.4'
    And header Authorization = '0995b1a23d0969e0e6c23bcee55c72e0daf0cc917e6ce8162ed65aabebbf2c72'
    Given url 'https://gorest.co.in/public/v1/users'
    And path '30'
    When method GET
    Then status 200
    * print response