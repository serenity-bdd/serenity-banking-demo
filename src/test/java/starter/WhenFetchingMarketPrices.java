package starter;

import io.restassured.RestAssured;
import net.serenitybdd.junit.runners.SerenityRunner;
import net.serenitybdd.rest.Ensure;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;

import static net.serenitybdd.rest.SerenityRest.given;
import static net.serenitybdd.rest.SerenityRest.when;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.greaterThan;

@RunWith(SerenityRunner.class)
public class WhenFetchingMarketPrices {

    @Before
    public void setBaseURLs() {
        RestAssured.baseURI = "https://api.iextrading.com/1.0";
    }

    @Test
    public void should_retrieve_latest_market_price_for_a_given_stock() {
        given().queryParam("symbols","aapl").
        when().get("/tops/last");

        Ensure.that("the stock is AAPL", response -> response.body("symbol[0]", equalTo("AAPL")))
                .andThat("the price is not zero", response -> response.body("price[0]", greaterThan(0.0f)));
    }
}
