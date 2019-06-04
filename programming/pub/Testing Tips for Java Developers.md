### Mockito
- [Don't mock too much, only mock directly dependence](http://googletesting.blogspot.com/2013/05/testing-on-toilet-dont-overuse-mocks.html)
- Steps: create mock:@Mock -> stubbing:when/thenReturn -> Verify: verify
- **@Spy**: used to wrap a real object. Every call, unless specified otherwise, is delegated to the object.
```java
import static org.mockito.Mockito.*;
@RunWith(MockitoJUnitRunner.class)
// When can't use @RunWith, for example test class already extends another base class.
@Rule public MockitoRule mockitoRule = MockitoJUnit.rule();
// Annotations
@Mock
Mockito.mock(XX.class) // or
@Spy
@InjectMocks
@Captor

ArgumentCaptor<XClass> captor=ArgumentCaptor.forClass(XClass.class);
verify(mock).doSomething(capto.capture());
// Stubbing
when(mockObj.someMethod(0)).thenReturn("someThing");
when(mockObj.someMethod(1)).thenThrow(new RuntimeException());
when(instance.someMethod()).thenReturn(someValue);
thenThrow(Throwable)
thenCallRealMethod()
```

#### doReturn|Answer|Throw()
- [Important gotcha on spying real objects!](https://static.javadoc.io/org.mockito/mockito-core/2.7.15/org/mockito/Mockito.html#13)
- use doReturn|Answer|Throw() to stub spy object
- use doXXX on void methods
```java
// spy instance field
Typex ox = Mockito.spy(anObject.aField);
anObject.aField = ox;

doReturn("some").when(spyObj).someMethod();

doCallRealMethod().when(instance).voidMethod();
doThrow(new Exception()).when(instance).voidMethod()

verify(mockObj, never()).someMethod(param);
verifyZeroInteractions(mock...);
verify(mockObj, atLeast(2)).someMethod();
verify(mockObj, times(3)).someMethod();
```

#### reset
- after reset

##### Mock chained calls
```java
@Mock(answer = Answers.RETURNS_DEEP_STUBS)
SomeService service;

when(service.getX().getY()).thenReturn(Z);
```
##### Do different things when call multiple times
```java
doReturn(null).doReturn(anotherInstance).when(mock).method();
```

##### Invalid use of argument matchers!
- When using matchers, all arguments have to be provided by matchers.
```java
//incorrect: 
someMethod(anyObject(), "raw String"); 
// Should be
someMethod(anyObject(), eq("raw String"));
```

##### [UnfinishedVerificationException: Missing method call for verify(mock)](https://stackoverflow.com/questions/15904584/mockito-gives-unfinishedverificationexception-when-it-seems-ok/)
- in verify, use any() for primitive arguments

##### Testing Servlet
```java
when(request.getParameter("user")).thenReturn("userA");
verify(response).setContentType("plain/text");
verify(response).addHeader("headerA")).thenReturn("value");
```

---

### Hamcrest
- More Readable.
- Provides Better Failure Messages
- Type Safety
- [hasItem, contains, containsInAnyOrder](https://stackoverflow.com/questions/33840531/how-do-hamcrests-hasitems-contains-and-containsinanyorder-differ)
```java
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;
org.hamcrest.Matchers
containsString, startsWith, endsWith, equalTo,equalToIgnoringCase, equalToIgnoringWhitespace, isEmpty, isEmptyOrNull and stringContainsInOrder

assertThat(actual, containsString(expected));
assertThat(actual, nullValue());
assertThat(actual, notNullValue());

assertThat(subClass, instanceOf(BaseClass.class));
```
---
### JUnit
```java
@Test(expected=XXException.class)
@Rule
public ExpectedException thrown = ExpectedException.none();
thrown.expect(XyzException.class); // before call the tested method
thrown.expectMessage(containsString("/ by zero"));
import static org.hamcrest.Matchers.hasProperty;

thrown.expect(hasProperty("errCode", is(666)));

public TemporaryFolder folder = new TemporaryFolder();
public ErrorCollector collector = new ErrorCollector();
public @Rule ExternalResource rule = new ExternalResource() {};
```
#### [Rules](https://github.com/junit-team/junit4/wiki/Rules)
- TemporaryFolder, ExternalResource, ErrorCollector, Timeout, ExpectedException
- [TestName](https://junit.org/junit4/javadoc/4.12/org/junit/rules/TestName.html)
- [run a JUnit test multiple times until failure](https://stackoverflow.com/questions/1835523/is-there-a-way-to-make-eclipse-run-a-junit-test-multiple-times-until-failure)
  - [RunUntilFailure](https://www.codeaffine.com/2013/04/10/running-junit-tests-repeatedly-without-loops/)
  - @Rule public SimpleRepeatRule repeatRule = new SimpleRepeatRule();
---

### [TestNG]
  - [Testing with TestNG](/2016/05/testing-with-testng.html)

#### [Spring + JUnit](https://www.mkyong.com/unittest/junit-spring-integration-example/)
- [docs](https://docs.spring.io/spring/docs/current/spring-framework-reference/testing.html#integration-testing)
- [JUnit 4.11 does not work with Spring Test framework](/2016/09/initializationerror-when-use-spring.html)

#### Using REST Assured to test http APIs
```java
Response rsp = given().filter(sessionFilter).when().get(someUrl).then().statusCode(is(200))).extract().response()
Map importResult = rsp.as(Map[].class)[0];

assertThat(Boolean.valueOf(importResult.get("success").toString()), is(true));
```

#### [randomizedtesting](https://github.com/randomizedtesting/randomizedtesting/wiki)
```java
@RunWith(RandomizedRunner.class)
@Seed("the-seed")
@com.carrotsearch.randomizedtesting.annotations.Repeat(iterations = 5)
```
---

### Eclipse
- [Eclipse Tips](/2016/02/eclipse-tips-trick-2016.html)

#### Plugins
- [MoreUnit](https://marketplace.eclipse.org/content/moreunit)
  - Ctrl+U: create test method
  - Ctrl+J:  jump to test method

#### Add Static Import Automatically
- To help write test cases easier, when we type "assertT" and hit Ctrl+Space, we want Eclipse to add static import automatically for us: import static org.hamcrest.MatcherAssert.assertThat;
- Go to  Window > Preferences > Java > Editor > Content Assist > Favorites, then add:
```java
org.hamcrest
org.hamcrest.Matchers.*
org.hamcrest.CoreMatchers.*

org.junit.*
org.junit.Assert.*
org.junit.Assume.*
org.junit.matchers.JUnitMatchers.*

org.mockito.Mockito
org.mockito.Matchers
org.mockito.ArgumentMatchers
io.restassured.RestAssured
```

#### Run Tests across Multiple Projects
- [Eclipse Tips + Tricks - 2016](/2016/02/eclipse-tips-trick-2016.html)
- <https://github.com/takari/takari-cpsuite>

Create a maven project depending on all the projects you want to test.\
Create Test code:
```java
import org.junit.extensions.cpsuite.ClasspathSuite;
import org.junit.runner.RunWith;
@RunWith(ClasspathSuite.class)
public class TestRunner {
}
```

#### Maven
- Run specific method: mvn test -Dtest=className#methodName

### Misc
- [json-server - Get a full fake REST API Server](https://github.com/typicode/json-server)
- Loading test
- JMeter
- [Tsung](http://tsung.erlang-projects.org/)
- [locustio](http://locust.io/)