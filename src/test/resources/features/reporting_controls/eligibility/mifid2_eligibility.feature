@tag:compliance
@jurisdiction:mifid2
Feature: Determining MIFID II eligibility

  As a a
  I want b
  So that c

  Background:
    Given we have some reference data
    And we have some trades

  Scenario Outline: Trades where the counterparty is a US Resident or guaranteed by a US resident are MIFID 2 eligible

  It's all about the **counterparty**

    When a trade has a counterparty domiciled in <Counterparty Domicile>
    And a guarantor domiciled in <Counterparty Guarantor Domicile>
    Then the trade CFTC eligibility is <CFTC Eligible>
    And the egilibility reason should be <Eligibility reason>

    Examples: CFTC eligibility
      | Counterparty Domicile | Counterparty Guarantor Domicile | CFTC Eligible | Eligibility reason                                                   |
      | US                    |                                 | Yes           | Counterparty is a US resident                                        |
      | Non-US                | US                              | Yes           | Counterparty is guaranteed by a US resident                          |
      | Non-US                |                                 | No            | Counterparty is neither a US resident of guaranteed by a US resident |
