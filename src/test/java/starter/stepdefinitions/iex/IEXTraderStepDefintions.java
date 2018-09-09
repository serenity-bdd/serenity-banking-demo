package starter.stepdefinitions.iex;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;

public class IEXTraderStepDefintions {

    @Given("^I am an active trader on IEX$")
    public void i_am_an_active_trader() {
        RestAssured.baseURI = "https://api.iextrading.com";
        RestAssured.basePath = "/1.0";
    }
}
