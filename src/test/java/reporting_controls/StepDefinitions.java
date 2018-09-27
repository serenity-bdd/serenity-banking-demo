package reporting_controls;

import cucumber.api.DataTable;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
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
}
