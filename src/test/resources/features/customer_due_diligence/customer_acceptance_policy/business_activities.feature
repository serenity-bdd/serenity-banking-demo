Feature: Business Activities

  Some business activities are considered more risk-prone than others.
  Although any type of account is potentially vulnerable to money laundering or terrorist financing,
  by the nature of their business, occupation, or anticipated transaction activity, certain customers and entities may pose specific risks.

  The business activity risk factor for an industry is determined by the potential risk they present to the bank. For example:

  {Examples} The business activity risk factor for an industry

  Business activity risk for a customer with an estabilished business (in activity for 2 years or more) depends on the business activity risk factor:

  {Examples} The business activity risk factor for an established business


  The Business Activity Risk factor for a customer is determined by the industry risk factor, how long the business has been in activity. A business with less than 2 years activity is considered high risk:

  {Examples} Businesses established less than 2 years ago are considered higher risk


  Scenario Outline: The business activity risk factor for an industry

  The industry risk factor is a value from 0 to 10.

    When a customer works in <Business Category>
    Then their base business activity risk factor should be <Risk Factor>

    Examples:
      | Business Category        | Risk Factor |
      | Casino                   | 10          |
      | Precious Metals Exchange | 9           |
      | Currency Exchange        | 9           |
      | Jewellery Store          | 8           |
      | Convenience Store        | 7           |
      | Real Estate Broker       | 6           |
      | Software Development     | 3           |

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
      | Business Start Date | Application Date | Business Category    | Risk Rating  |
      | 01-01-2016          | 31-12-2017       | Software Development | Medium       |
      | 01-01-2018          | 31-01-2018       | Jewellery Store      | High         |
      | 01-01-2018          | 31-01-2018       | Casino               | Unacceptable |