

[Test Behavior, Not Implementation](https://testing.googleblog.com/2013/08/testing-on-toilet-test-behavior-not.html)



[Write a separate test for each behavior defined by a method](https://testing.googleblog.com/2018/06/testing-on-toilet-keep-tests-focused.html)
- use separate tests to verify separate behaviors of a method, no 1:1 relationship between test and method.


#### Tests independent behaviors of a method separately

#### Contains only information relevant to the test and verifies only a single fact

[Only Verify Relevant Method Arguments](https://testing.googleblog.com/2018/06/testing-on-toilet-only-verify-relevant.html)



Testing Via Public APIs

Keeps implementation details private and test them via the public API

antipattern:
- extending a class under test to override certain methods and change their behavior


Test names should include the condition being tested and the expected outcome.

methodName_condition_outcome


#### When write tests
Minimize the use of control structures, complex calculations in unit tests.

- [TotT: Don't Put Logic in Tests](https://testing.googleblog.com/2014/07/testing-on-toilet-dont-put-logic-in.html)


keep all tests for a class together


no test should depend explicitly on what is done in a @Before method

[Putting both the scenario and the expected outcome in the test name](https://testing.googleblog.com/2014/10/testing-on-toilet-writing-descriptive.html)

never let tests explicitly rely on values defined in setUp

[write tests where the effects immediately follow the causes](https://testing.googleblog.com/2017/01/testing-on-toilet-keep-cause-and-effect.html)

Use helper methods to move unimportant details out of the test method's body
Factory methods: newAccountWithBalance, newEmptyAccount
[test data builder pattern](https://testing.googleblog.com/2018/02/testing-on-toilet-cleanly-create-test.html)
- The helper method initializes logically-required fields to reasonable defaults, so each test can specify only fields relevant to the case being tested


Assertions: assertSomeFact

