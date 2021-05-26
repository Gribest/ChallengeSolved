# ChallengeSolved

Setting Up Karate
The folder structure for Karate tests is given in the Karate documentation on folder structure, but the summary is that:

All tests are defined in *.feature files
For every feature file package, you need to have an empty test-class in the same package under src/test/java
Karate recommends to keep the *.feature files in the same folder as the test-class
In this example, we have two features hello and person. Their *.feature files and test-classes are kept in src/test/java/karate/product and src/test/java/karate/productreview respectively

Note that the test-class file do NOT use the *Test.java file naming convention used by JUnit4 classes. This actually ensures that these tests will not be picked up when when invoking mvn test (for the whole project) from the command line. But they can still be invoked from the IDE.

A *.feature file has the same syntax as Gherkin/Cucumber and is also described in Karate documentation. The key points are

Lines that start with # are comments
There are three sections
Feature : A name for the tests in this feature file
Background : The steps in this section are executed before every Scenario in that file.
Scenario : Each scenario is a test. A file can contain multiple Scenarios.
Each scenario is described using
Given : setting up the test
When : the test action that will be performed
Then : the expected outcome(s)
The karate-config.js file in the /test/java folder contains the environment and global variables used by Karate. This is is basically a javascript function that returns a JSON object. Which means that the file cannot contain any comment statements before the function body.


Logging Configuration
Logging configuration is controlled by the /test/java/logback.xml file as explained in the Karate documentation on logging.

Running the tests
We have three types of tests - unit tests, Spring integration tests, and Karate tests. Ideally we want to be able to run them from both the command-line and the IDE.

Unit tests : are meant to run super fast
Spring integration tests : run slower because the entire application context has to be created
Karate tests : require the system under test to be running

Running the Karate Tests
From IntelliJ
The Karate tests can also be invoked from within IntelliJ in multiple ways

Right-click on test/java/karate/KarateTests to run all the tests
Right-click on the individual runners (e.g., test/java/karate/person/PersonRunner) to run all the tests there
Right-click on a *.feature file to run only that feature
To run a single scenario, open the feature file, and right click on the specific scenario
The test results can be viewed in the browser at file:///<projectroot>/target/surefire-reports/karate-summary.html

From command-line using Maven
Karate does NOT start up the system under test. So first start up the application by running

$ mvn spring-boot:run
To run all the tests ( they are all under karate), run

$ mvn test -Dtest=KarateTests

Note : The test report from the IDE and the command-line are generated in DIFFERENT places. Reports for test run from the IDE are stored in the target folder.
Report for tests run from the command-line are stored in the build folder.


After setting up the dummy.feature file can be run to confirm the working of the setup.
The product and productreview feature files checks whether the apis are up and running.
 If they are up the test cases should pass.

 Detailed report can be found in the cucumber report in target folder.
