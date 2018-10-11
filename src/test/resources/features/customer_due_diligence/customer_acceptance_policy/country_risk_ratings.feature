Feature: Country risk ratings

  Both country of origin and country of domicile are used as factors in determining whether the bank wishes to do business with a given customer.
  Each country is given a risk coefficient between 0 (low risk) and 10 (high risk).

  For example:

  {Examples} Each country has a risk rating based on anti-money-laundering and anti-corruption considerations

  The full country list should be provided by the reference data service.

  Countries are categorised as low, medium and high risk based on their score.

  For example:

  {Examples} Countries are categorised as low, medium and high risk based on their risk rating


  The country risk for a customer is based on their country of domicile and their country of origin, as shown below:

  {Examples} Overall customer risk is based on country of origin and country of domicile

  More detailed examples are provided in the scenarios.


  Scenario Outline: Each country has a risk rating based on anti-money-laundering and anti-corruption considerations

    Given a customer who is domiciled in <Country>
    When his risk coefficient is calculated
    Then his country risk factor should be <Risk Factor>

    Examples:
      | Country        | Risk Factor |
      | Iran           | 8.6         |
      | Afghanistan    | 8.38        |
      | Haiti          | 7.5         |
      | Nicaragua      | 6.64        |
      | China          | 6.53        |
      | United Kingdom | 4.81        |
      | Estonia        | 3.83        |
      | Finland        | 3.04        |

  Scenario Outline: Countries are categorised as low, medium and high risk based on their risk rating
    When the country has a risk factor that is <Risk Factor>, such as <Sample Country>
    Then the risk rating should be <Risk Rating>

    Examples:
      | Risk Factor | Risk Rating | Sample Country |
      | 7 or above  | High        | Iran           |
      | 5 to 7      | Medium      | Nicaragua      |
      | Below 5     | Low         | Estonia        |


  Scenario Outline: Overall customer risk is based on country of origin and country of domicile
    Given Joe is a prospective customer who is domiciled in <domicile>
    And who comes from <origin>
    When his overall country risk is calculated
    Then the overall risk category should be <risk>
    Examples:
      | domicile | origin | risk   |
      | high     | Any    | high   |
      | Any      | high   | high   |
      | medium   | medium | medium |
      | medium   | low    | medium |
      | low      | medium | low    |
      | low      | low    | low    |
