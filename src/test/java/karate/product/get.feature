Feature: Product get methods

  Background:
    Given url productUrl

  Scenario: Verify if the get method is up and running and fetches the product details
    When method GET
    Then status 200


  Scenario: Verify if the get method is up and does not fetches an invalid  product
    Given path '/id'
    When method GET
    Then status 404
    And print response


