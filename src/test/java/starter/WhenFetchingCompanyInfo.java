package starter;

import io.restassured.RestAssured;
import io.restassured.response.ValidatableResponse;
import net.serenitybdd.junit.runners.SerenityRunner;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ExecutedStepDescription;
import net.thucydides.core.steps.StepEventBus;
import net.thucydides.core.steps.StepFailure;
import org.hamcrest.Matchers;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;

import java.util.function.Consumer;

import static net.serenitybdd.rest.SerenityRest.when;
import static org.hamcrest.Matchers.equalTo;

@RunWith(SerenityRunner.class)
public class WhenFetchingCompanyInfo {

    @Before
    public void setBaseURLs() {
        RestAssured.baseURI = "https://api.iextrading.com/1.0";
    }

    // Version 1 - check that the request returns 200
    @Test
    public void should_succeed_for_listed_companies() {
        when().get("https://api.iextrading.com/1.0/stock/aapl/company")
                .then().statusCode(200);
    }

    @Test
    public void should_include_company_name_and_industry() {

        when().get("/stock/aapl/company").then().statusCode(200);

        checkThat("Company name should be returned",
                  response -> response.body("companyName", equalTo("Apple Inc.")));

        checkThat("Company industry should be returned",
                  response -> response.body("industry", equalTo("Computer Hardware")));
    }

    private void checkThat(String description, Consumer<ValidatableResponse> check) {
        StepEventBus.getEventBus().stepStarted(ExecutedStepDescription.withTitle(description));
        try {
            check.accept(SerenityRest.then());
        } catch(Throwable e) {
            StepEventBus.getEventBus().stepFailed(new StepFailure(ExecutedStepDescription.withTitle(description), e));
        } finally {
            StepEventBus.getEventBus().stepFinished();
        }
    }

    // Version 1 - check that the request returns 200
    @Test
    public void should_fail_for_unknown_companies() {
        when().get("https://api.iextrading.com/1.0/stock/unknown/company")
                .then().statusCode(404);
    }
}
