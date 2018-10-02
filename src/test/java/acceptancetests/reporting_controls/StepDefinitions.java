package acceptancetests.reporting_controls;

import cucumber.api.DataTable;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.serenitybdd.core.Serenity;
import org.assertj.core.api.Assertions;
import org.openqa.selenium.ElementNotVisibleException;
import org.openqa.selenium.WebDriverException;

public class StepDefinitions {

    @Given("^Sample CFTC counterparties:$")
    public void known_counterparties(DataTable arg1) {
        // Write code here that turns the phrase above into concrete actions
        // For automatic transformation, change DataTable to one of
        // List<YourType>, List<List<E>>, List<Map<K,V>> or Map<K,V>.
        // E,K,V must be a scalar (String, Integer, Date, enum etc).
        // Field names for YourType must match the column names in
        // your feature file (except for spaces and capitalization).
    }

    @Then("^Examples of CFTC eligibility$")
    public void examples_of_CFTC_Eligable_trades(DataTable arg1) {
        // Write code here that turns the phrase above into concrete actions
        // For automatic transformation, change DataTable to one of
        // List<YourType>, List<List<E>>, List<Map<K,V>> or Map<K,V>.
        // E,K,V must be a scalar (String, Integer, Date, enum etc).
        // Field names for YourType must match the column names in
        // your feature file (except for spaces and capitalization).
    }



    @When("^a trade has a counterparty domiciled in US$")
    public void a_trade_has_a_counterparty_domiciled_in_US() {
    }


    @When("^a guarantor domiciled in $")
    public void a_guarantor_domiciled_in() {
    }

    @Then("^the trade CFTC eligibility is Yes$")
    public void the_trade_CFTC_eligibility_is_Yes() {
    }

    @Then("^the egilibility reason should be Counterparty is a US resident$")
    public void the_egilibility_reason_should_be_Counterparty_is_a_US_resident() {
    }

    @Given("^the following transation is reportable$")
    public void the_following_transation_is_reportable(DataTable arg1) {
        // Write code here that turns the phrase above into concrete actions
        // For automatic transformation, change DataTable to one of
        // List<YourType>, List<List<E>>, List<Map<K,V>> or Map<K,V>.
        // E,K,V must be a scalar (String, Integer, Date, enum etc).
        // Field names for YourType must match the column names in
        // your feature file (except for spaces and capitalization).
    }

    @Given("^the following transation is eligible")
    public void the_following_transation_is_eligible(DataTable arg1) {
        throw new IllegalStateException();
    }

    @When("^the transaction is processed$")
    public void the_transaction_is_processed() {
       Serenity.recordReportData()
               .withTitle("Transaction details")
               .andContents("####Transaction Details\nABC;DEF;123;567;100.00");
    }

    @Then("^the transaction should become:$")
    public void the_transaction_should_become(DataTable arg1) {
    }

    @When("^the transaction is rejected$")
    public void the_transaction_is_rejected() {
        Assertions.assertThat(true).isFalse();
    }

    @When("^the transaction is discarded")
    public void the_transaction_is_discarded() {
        throw new IllegalStateException("Nasty error");
    }

    @Given("^we have some reference data$")
    public void weHaveSomeReferenceData() throws Throwable {
    }

    @And("^we have some trades$")
    public void weHaveSomeTrades() throws Throwable {
    }

    @When("^a trade has a counterparty domiciled in Puerto Rico$")
    public void aTradeHasACounterpartyDomiciledInPuertoRico() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
        throw new ElementNotVisibleException("Oh crap!",new WebDriverException("Oh bugger!"));
    }

    @And("^a guarantor domiciled in Porto Rico$")
    public void aGuarantorDomiciledInPortoRico() throws Throwable {
    }

    @Then("^the trade is not CFTC eligibile$")
    public void theTradeIsNotCFTCEligibile() throws Throwable {
    }

    @When("^a trade has a counterparty domiciled in Costa Rica$")
    public void aTradeHasACounterpartyDomiciledInCostaRica() throws Throwable {
        throw new AssertionError("Oh crap!");
    }

    @When("^a trade has a counterparty domiciled in Canada$")
    public void aTradeHasACounterpartyDomiciledInCanada() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
    }


    @Given("^a customer who is domiciled in (.*)")
    public void a_customer_who_is_domiciled_in(String country) {
    }


    @When("^his risk coefficient is calculated$")
    public void his_risk_coefficient_is_calculated() {
    }

    @Then("^his country risk factor should be (.*)$")
    public void his_country_risk_factor_should_be(float rating) {
    }

    @Then("^the risk rating should be (.*)$")
    public void theRiskRatingShouldBeRiskRating(String expectedRating) throws Throwable {
    }

    @And("^who comes from (.*)$"    )
    public void whoComesFromOrigin(String origin) {
        // Write code here that turns the phrase above into concrete actions
    }

    @Given("^Joe is a prospective customer who is domiciled in (.*)$")
    public void joeIsAProspectiveCustomerWhoIsDomiciledInDomicile(String domicile) throws Throwable {
    }

    @When("^the country has a risk factor that is (.*), such as (.*)")
    public void theCountryIsCountry(String riskFactor, String country) throws Throwable {
    }

    @When("^his overall country risk is calculated$")
    public void hisOverallCountryRiskIsCalculated() throws Throwable {
        // Write code here that turns the phrase above into concrete actions
    }

    @Then("^the overall risk category should be (.*)$")
    public void theOverallRiskCategoryShouldBeRisk(String risk) throws Throwable {
        // Write code here that turns the phrase above into concrete actions
    }



    @When("^a customer works in (.*)")
    public void a_customer_works_in_Casino(String business) {
    }


    @Then("^their base business activity risk factor should be (\\d+)$")
    public void their_base_business_activity_risk_factor_should_be(int risk) {
    }




    @When("^a customer with a business risk factor of (.*), such as for a (.*) business$")
    public void a_customer_with_a_business_risk_factor_of_or_above_such_as_for_a_Casino_business(String risk, String business) {
    }

    @When("^the business been operation for more than two years$")
    public void the_business_been_operation_for_more_than_two_years() {
    }

    @Then("^their business activity risk rating should be (.*)")
    public void their_business_activity_risk_rating_should_be(String risk) {
    }

    @When("^a customer with a business risk factor of (.*), such as for a (.*)  business$")
    public void aCustomerWithABusinessRiskFactorOfRiskFactorSuchAsForABusinessCategoryBusiness(int risk, String category) throws Throwable {
    }

    @When("^a business of type (.*) established on (.*) applies to open an account on (.*)$")
    public void aBusinessAppliesToOpenAnAccount(String business, String startDate, String applicationDate) throws Throwable {
    }
}
