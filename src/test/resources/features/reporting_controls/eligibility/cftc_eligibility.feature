@tag:compliance
@jurisdiction:cftc
Feature: Determining CFTC eligibility


  The U.S. Commodity Futures Trading Commission is an independent agency of the US government created in 1974, that regulates futures and option markets.
  The stated mission of the CFTC is to foster open, transparent, competitive, and financially sound markets, to avoid systemic risk,
  and to protect the market users and their funds, consumers, and the public from fraud, manipulation, and abusive practices
  related to derivatives and other products that are subject to the Commodity Exchange Act.

  A trade is eligible for CFTC if the counterparty is a US resident *OR* guaranteed by a US resident.
  There should be a record to describe which case applies.

  The basic logic is like this:
  {Scenario} Trades where the counterparty is a US Resident or guaranteed by a US resident are CFTC eligible

  Here are some examples:
  {Examples} Trades where the counterparty is a US Resident or guaranteed by a US resident are CFTC eligible

  Background:
    Given we have some reference data
    And we have some trades

  Scenario Outline: Trades where the counterparty is a US Resident or guaranteed by a US resident are CFTC eligible

  It's all about the **counterparty**

    When a trade has a counterparty domiciled in <Counterparty Domicile>
    And a guarantor domiciled in <Counterparty Guarantor Domicile>
    Then the trade CFTC eligibility is <CFTC Eligible>
    And the eligibility reason should be <Eligibility reason>

    Examples: CFTC eligibility
      | Counterparty Domicile | Counterparty Guarantor Domicile | CFTC Eligible | Eligibility reason                                                   |
      | US                    |                                 | Yes           | Counterparty is a US resident                                        |
      | Non-US                | US                              | Yes           | Counterparty is guaranteed by a US resident                          |
      | Non-US                |                                 | No            | Counterparty is neither a US resident of guaranteed by a US resident |

    Examples: Other types of CFTC eligibility
      | Counterparty Domicile | Counterparty Guarantor Domicile | CFTC Eligible | Eligibility reason                                                   |
      | US                    |                                 | Yes           | Counterparty is a US resident                                        |
      | Non-US                | US                              | Yes           | Counterparty is guaranteed by a US resident                          |
      | Non-US                |                                 | No            | Counterparty is neither a US resident of guaranteed by a US resident |


  Scenario: Puerto Rico Guarantors are not included
    When a trade has a counterparty domiciled in Puerto Rico
    And a guarantor domiciled in Porto Rico
    Then the trade is not CFTC eligibile

  Scenario: An internal error is generated if the submissibility of an eligible transaction cannot be determined
    Given the following transation is eligible
      | Trade ID | Jurisdiction | State      |
      | 101      | Bundesbank   | Reportable |
    When the transaction is rejected
    Then the transaction should become:
      | Trade ID | Jurisdiction | State          |
      | 101      | Bundesbank   | Internal Error |

  @skip
  Scenario: An internal error is generated if some other error happens
    Given the following transation is eligible
      | Trade ID | Jurisdiction | State      |
      | 101      | Bundesbank   | Reportable |
    When the transaction is rejected
    Then the transaction should become:
      | Trade ID | Jurisdiction | State          |
      | 101      | Bundesbank   | Internal Error |

  @ignore
  Scenario: An internal error is generated if the external system is down
    Given the following transation is eligible
      | Trade ID | Jurisdiction | State      |
      | 101      | Bundesbank   | Reportable |
    When the transaction is rejected
    Then the transaction should become:
      | Trade ID | Jurisdiction | State          |
      | 101      | Bundesbank   | Internal Error |

  Scenario: Costa Rica Guarantors are not allowed for transactions above $1,000,000
    When a trade has a counterparty domiciled in Costa Rica
    And a guarantor domiciled in Porto Rico
    Then the trade is not CFTC eligibile

  Scenario: Don't even mention Canada
    When a trade has a counterparty domiciled in Canada
    And a guarantor domiciled in Porto Rico
    Then the trade is not CFTC eligibile

