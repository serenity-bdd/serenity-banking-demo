package acceptancetests.reporting_controls.aquisition;

import acceptancetests.reporting_controls.aquisition.steps.AcquisittionSteps;
import net.serenitybdd.junit.runners.SerenityRunner;
import net.thucydides.core.annotations.Narrative;
import net.thucydides.core.annotations.Pending;
import net.thucydides.core.annotations.Steps;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(SerenityRunner.class)
@Narrative(title="Trade Acquisistion",
text = {"The acquisition state represents the initial entry into a system for a transaction event."})
public class PositionsAcquisition {

    @Steps
    AcquisittionSteps acquisittionSteps;

    @Test
    public void basic_acquisition() {
        acquisittionSteps.givenASourceSystem("SRC");
        acquisittionSteps.whenSomeTradesAreEntered();
        acquisittionSteps.thenTheyShouldBeAquired();
    }

    @Test
    @Pending
    public void handling_corrupt_input_data() {}

}
