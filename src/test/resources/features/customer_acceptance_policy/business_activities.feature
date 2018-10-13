Feature: Business Activities

  Some business activities are considered more risk-prone than others, and certain customers and entities may pose specific risks.

  The business activity risk factor for an industry is determined by the potential risk they present to the bank. For example:

  {Examples!WithTitle} High Risk

  Business activity risk for a customer with an estabilished business (in activity for 2 years or more) depends on the business activity risk factor:

  {Examples} The business activity risk factor for an established business


  The Business Activity Risk factor for a customer is determined by the industry risk factor, how long the business has been in activity. A business with less than 2 years activity is considered high risk:

  {Examples} Businesses established less than 2 years ago are considered higher risk

  Scenario Outline: The business activity risk factor for an industry

  The industry risk factor is a value from 0 to 10.

    When a customer works in <Business Category>
    Then their base business activity risk factor should be <Risk Factor>

    Examples: High Risk
      | Business Category        | Risk Factor |
      | Casino                   | 10          |
      | Precious Metals Exchange | 9           |
      | Currency Exchange        | 9           |
      | Jewellery Store          | 8           |

    Examples: Medium Risk
      | Business Category  | Risk Factor |
      | Convenience Store  | 7           |
      | Real Estate Broker | 6           |

    Examples: Low Risk
      | Business Category    | Risk Factor |
      | Software Development | 3           |

  Scenario: An example of a high risk business
    Given a business with the following details:
      | Name | Category |
      | ACME | Casino   |
    When the business risk profile is assessed
    Then the risk rating should be High

  Scenario Outline: A few more examples of a high risk businesses
    Given a business with the following details:
      | Name | Category |
      | <Name> | <Category>   |
    When the business risk profile is assessed
    Then the risk rating should be <Risk>
    Examples:
      | Name  | Category             | Risk   |
      | Teds  | Convenience Store    | Medium |
      | Jills | Software Development | Low    |


  Scenario Outline: The business activity risk factor for an established business
  Established businessess have been in activity for 2 years or more

    When a customer with a business risk factor of <Risk Factor>, such as for a <Business Category> business
    And the business been operation for more than two years
    Then their business activity risk rating should be <Risk Rating>

    Examples:
      | Risk Factor | Business Category    | Risk Rating |
      | 7 or above  | Casino               | High        |
      | 5 to 7      | Jewellery Store      | Medium      |
      | Under 5     | Software Development | Low         |

  Scenario Outline: Businesses established less than 2 years ago are considered higher risk
    When a business of type <Business Category> established on <Business Start Date> applies to open an account on <Application Date>
    Then their business activity risk rating should be <Risk Rating>

    Examples:
      | Business Start Date | Application Date | Business Category    | Risk Rating  | Region | Additional Comments | ExtraWideColumn | NothingToSeeHere | MoveAlong | MoveAlong | Region | Additional Comments | ExtraWideColumn | NothingToSeeHere | MoveAlong | MoveAlong |
      | 01-01-2016          | 31-12-2017       | Software Development | Medium       | APAC   |                     |                 |                  |           |           | APAC   |                     |                 |                  |           |           |
      | 01-01-2018          | 31-01-2018       | Jewellery Store      | High         | EMEA   |                     |                 |                  |           |           | EMEA   |                     |                 |                  |           |           |
      | 01-01-2018          | 31-01-2018       | Casino               | Unacceptable | USA    |                     |                 |                  |           |           | USA    |                     |                 |                  |           |           |