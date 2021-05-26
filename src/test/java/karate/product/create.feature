Feature: Create and Read products

  Background:
     Given url productUrl


  Scenario: Create a product using the post method

    And request { "id": "id23","name": "Nebzud","description": "Runner shoe","imgUrl": "string" }
    And header Accept = 'application/json'
    When method post
    Then status 200
    And print response

  Scenario: Fetch the same created product from db
    Given path '/id23'
    When method GET
    Then status 200
    And print response

