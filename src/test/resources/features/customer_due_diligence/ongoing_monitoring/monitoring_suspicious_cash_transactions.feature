Feature: Monitoring suspicious cash transactions

  Accounts with large cash deposits, or with a large number of smaller transactions exceeding the threshold,
  should be flagged for review

  Scenario: Large cash transactions

  Cash transactions over $10000 should be reported

    Given Joe is a new customer with a standard business account
    And Joe makes the following transactions:
      | Transaction ID | Date       | Type         | Amount |
      | 101            | 01-05-2018 | Cash Deposit | 1000   |
      | 102            | 03-05-2018 | Cash Deposit | 12000  |
      | 103            | 05-05-2018 | Cash Deposit | 200    |
    Then the reported trades should be as follows
      | Transaction ID | Date       | Type         | Amount | AML Flagged | Reason                          |
      | 102            | 03-05-2018 | Cash Deposit | 12000  | Yes         | Cash deposit exceeded threshold |
    And an account review request should be submitted
