package iextrader;

import io.restassured.RestAssured;
import net.serenitybdd.junit.runners.SerenityRunner;
import net.serenitybdd.rest.Ensure;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;

import static net.serenitybdd.rest.SerenityRest.given;
import static net.serenitybdd.rest.SerenityRest.when;
import static org.hamcrest.Matchers.equalTo;

@RunWith(SerenityRunner.class)
public class WhenFetchingCompanyInfo {

    @Before
    public void setBaseURLs() {
        RestAssured.baseURI = "https://api.iextrading.com/1.0";
    }

    @Test
    public void should_succeed_for_listed_companies() {
        when().get("https://api.iextrading.com/1.0/stock/aapl/company")
                .then().statusCode(200);
    }

    @Test
    public void should_include_company_name_and_industry() {

        given().pathParam("symbol", "ibm").
                when().get("https://api.iextrading.com/1.0/stock/{symbol}/company")
                .then().statusCode(200);

        Ensure.that("company name is returned",  response -> response.body("companyName",
                                                            equalTo("International Business Machines Corporation")))
               .andThat("industry is returned", response -> response.body("industry",
                                                            equalTo("Application Software")));
    }

}
