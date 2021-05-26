Feature: Product Review get methods

  Background:
    Given url productreviewUrl


  Scenario: Verify if the get method is up and running and adds the review

    When method GET
    Then status 200
    And print response


