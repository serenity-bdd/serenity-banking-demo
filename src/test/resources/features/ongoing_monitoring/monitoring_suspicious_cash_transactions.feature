Feature: Monitoring suspicious cash transactions

  Accounts with large cash deposits, or with a large number of smaller transactions exceeding the threshold,
  should be flagged for review.

  Big cash transactions need to be spotted and reported, e.g.

  {Scenario} Large cash transactions

  Scenario: Large cash transactions

  Cash transactions over $10000 should be reported

    Given Joe is an existing customer with a standard business account
    When Joe makes the following transactions:
      | Transaction ID | Date       | Type         | Amount |
      | 101            | 01-05-2018 | Cash Deposit | 1000   |
      | 102            | 03-05-2018 | Cash Deposit | 12000  |
      | 103            | 05-05-2018 | Cash Deposit | 200    |
    Then the reported transactions should be as follows
      | Transaction ID | Date       | Type         | Amount | AML Flagged | Reason                          |
      | 102            | 03-05-2018 | Cash Deposit | 12000  | Yes         | Cash deposit exceeded threshold |
    And an account review request should be submitted


  Scenario: Many small cash transactions

  Cash transactions over $10000 should be reported even when they are made in many small deposits

    Given Joe is an existing customer with a standard business account
    When Joe makes the following transactions:
      | Transaction ID | Date       | Type         | Amount |
      | 101            | 01-05-2018 | Cash Deposit | 1000   |
      | 102            | 03-05-2018 | Cash Deposit | 2000   |
      | 103            | 07-05-2018 | Cash Deposit | 4000   |
      | 104            | 12-05-2018 | Cash Deposit | 4000   |
    Then the reported transactions should be as follows
      | Transaction ID | Date       | Type         | Amount | AML Flagged | Reason                                                    |
      | 101            | 01-05-2018 | Cash Deposit | 1000   | Yes         | Total Cash deposits in a 1 month period exceeded threshold|
      | 102            | 03-05-2018 | Cash Deposit | 2000   | Yes         | Total Cash deposits in a 1 month period exceeded threshold|
      | 103            | 07-05-2018 | Cash Deposit | 4000   | Yes         | Total Cash deposits in a 1 month period exceeded threshold|
      | 104            | 12-05-2018 | Cash Deposit | 4000   | Yes         | Total Cash deposits in a 1 month period exceeded threshold|
    And an account review request should be submitted


  Scenario: Many small cash transactions that are in the customer's normal usage patterns

  Cash transactions over $10000 should not be reported if they are in the customer's normal business

    Given Joe is an existing customer with a standard business account
    And Joe's average monthly cash deposits are $15000
    When Joe makes the following transactions:
      | Transaction ID | Date       | Type         | Amount |
      | 101            | 01-05-2018 | Cash Deposit | 1000   |
      | 102            | 03-05-2018 | Cash Deposit | 2000   |
      | 103            | 07-05-2018 | Cash Deposit | 4000   |
      | 104            | 12-05-2018 | Cash Deposit | 4000   |
    Then no transactions should be reported
