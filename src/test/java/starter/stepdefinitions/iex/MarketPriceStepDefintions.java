package starter.stepdefinitions.iex;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.serenitybdd.core.Serenity;

import static net.serenitybdd.rest.SerenityRest.then;
import static net.serenitybdd.rest.SerenityRest.when;
import static org.assertj.core.api.Assertions.assertThat;

public class MarketPriceStepDefintions {


    @When("^I request the latest price for (.*)$")
    public void i_request_the_latest_price_for(String symbol) {
        when().get("/stock/{symbol}/price", symbol)
              .then().statusCode(200);
    }

    @Then("^I should see the latest market price or the previous closed price$")
    public void i_should_see_the_latest_market_price_or_the_previous_closed_price() {
        Double price = then().extract().response().as(Double.class);

        Serenity.recordReportData().withTitle("Latest Price").andContents(price.toString());

        assertThat(price).isGreaterThan(0.0);
    }
}
