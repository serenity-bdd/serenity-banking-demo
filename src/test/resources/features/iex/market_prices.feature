Feature: Market Prices

  Information about the current and historical prices for given shares.

  Scenario: View a share price
  A single number, being the IEX real time price, the 15 minute delayed market price, or the previous close price, is returned.

  This scenario is for demonstration purposes.
  For a real application, we would need to explore the behaviour of retreiveing the latest market price or the closed price depending on the time,
  and be able to control or mock the market prices and status.

    Given I am an active trader on IEX
    When I request the latest price for AAPL
    Then I should see the latest market price or the previous closed price
