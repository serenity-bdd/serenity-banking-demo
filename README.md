# Serenity BDD Demonstration project

This project illustrates the Serenity BDD reporting and living documentation features.


## Get the code

Git:

    git clone https://github.com/wakaleo/serenity-banking-demo.git
    cd serenity-banking-demo


Or simply [download a zip](https://github.com/wakaleo/serenity-banking-demo/archive/master.zip) file.

## Use Maven

Open a command window and run:

    mvn clean verify

This runs Cucumber features using Cucumber's JUnit runner. The `@RunWith(CucumberWithSerenity.class)` annotation on the `CucumberTestSuite`
class tells JUnit to kick off Cucumber.

## Use Gradle

Open a command window and run:

    gradlew test aggregate

This runs Cucumber features using Cucumber's JUnit runner. The `@RunWith(CucumberWithSerenity.class)` annotation on the `CucumberTestSuite`
class tells JUnit to kick off Cucumber.

## Viewing the reports

Both of the commands provided above will produce a Serenity test report in the `target/site/serenity` directory. Go take a look! Note that these tests contain deliberate errors and failures to illustate how Serenity reports errors.

## To learn more

You can learn more about the living documentation features of Serenity in [the Serenity BDD Book](https://serenity-bdd.github.io/theserenitybook/latest/living-documentation.html).
