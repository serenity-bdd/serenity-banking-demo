package features.reporting_controls.aquisition;

import features.reporting_controls.aquisition.steps.AcquisittionSteps;
import net.serenitybdd.junit.runners.SerenityRunner;
import net.thucydides.core.annotations.Narrative;
import net.thucydides.core.annotations.Pending;
import net.thucydides.core.annotations.Steps;
import net.thucydides.core.annotations.WithTag;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(SerenityRunner.class)
@Narrative(title="Trade Acquisistion",
text = {"The acquisition state represents the initial entry into a system for a transaction event."})
@WithTag("acquisition")
public class TradeAcquisition {

    @Steps
    AcquisittionSteps acquisittionSteps;

    @Test
    @WithTag("volcker")
    public void volcker_acquisition() {
        acquisittionSteps.givenASourceSystem("SRC");
        acquisittionSteps.whenSomeTradesAreEntered();
        acquisittionSteps.thenTheyShouldBeAquired();
    }

    @Test
    @WithTag("ctfc")
    public void cftc_acquisition() {
        acquisittionSteps.givenASourceSystem("SRC");
        acquisittionSteps.whenSomeTradesAreEntered();
        acquisittionSteps.thenTheyShouldBeAquired();
    }

    @Test
    public void generic_acquisition() {
        acquisittionSteps.givenASourceSystem("SRC");
        acquisittionSteps.whenSomeTradesAreEntered();
        acquisittionSteps.thenTheyShouldBeAquired();
    }

}
