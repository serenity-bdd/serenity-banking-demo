Feature: Identifying a new customer
  The bank needs to identify any person or entity that maintains an account with the bank or those on whose behalf an account is maintained

  Scenario: Identifying a new customer living in the UK
    Given Joe is a new customer
    And Joe lives in the UK
    When Joe provides one piece of identity and one proof of address
    Then his identify should be established

  Scenario: Identifying a new customer not living in the UK
    Given Joe is a new customer
    And Joe does not live in the UK
    When Joe provides one piece of identity and proof of addresses over the past 3 years
    Then his identify should be established
