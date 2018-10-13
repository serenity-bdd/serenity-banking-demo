Feature: Monitoring new customers

  In order to comply with regulatory requirements to report suspicious transactions to the appropriate authorities
  We need to be able to monitor customer activity and identify unusual or suspicious patterns of activity.

  Scenario: Monitoring a new low risk customer
    Given Joe is a new customer
    And Joe is considered a low risk customer
    When he is onboarded
    Then his account should be scheduled for review in 3 months time
