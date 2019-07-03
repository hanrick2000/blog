##### [install gradle-completion](https://github.com/gradle/gradle-completion)

### build.gradle
##### [Dependency Resolution](https://gist.github.com/cr7pt0gr4ph7/6cd6339eabc2056bc3e7)
- The default behavior of Gradle to pick the newest version also applies if a lower version has been declared locally, but another dependency transitively pulls in a newer version. This is in contrast with Maven, where a locally declared version will always win.
```
configurations.all {
    resolutionStrategy {
        force "org.springframework:spring-tx:3.2.3.RELEASE"
    }
}


dependencies {
    compile("org.springframework.data:spring-data-hadoop:2.0.0.RELEASE")
    compile("org.springframework:spring-tx:3.2.3.RELEASE") {
        force = true
    }
}
```
#### Exclude
```
configurations {
    all*.exclude group: 'xml-apis', module: 'xmlParserAPIs'
}

compile("xyz") {
  exclude group: 'xml-apis', module: 'xmlParserAPIs'
}
```

#### Test
##### [Run specific test](https://docs.gradle.org/1.10/release-notes.html#executing-specific-tests-from-the-command-line)
```bash
gradle test --tests org.gradle.SomeTest.someMethod
gradle test --tests org.gradle.SomeTest
gradle test --tests org.gradle.internal*
//select all ui test methods from integration tests by naming convention
gradle test --tests *IntegTest*ui*
//selecting tests from different test tasks
gradle test --tests *UiTest integTest --tests *WebTest*ui
```
##### [Debugging when running tests](https://docs.gradle.org/current/userguide/java_testing.html)
- --debug-jvm: ./gradlew test --debug-jvm, listening on port 5005
- gradlew runApplication --debug-jvm
#### Commands
##### [Display project dependency](https://www.mkyong.com/gradle/gradle-display-project-dependency/)
```
./gradlew app:dependencies --configuration runtime
gradle :dependencyInsight --configuration compile --dependency jackson-databind
```


#### Tasks
- [Download](https://github.com/michel-kraemer/gradle-download-task) [files](https://michelkraemer.com/recipes-for-gradle-download/)

#### Eclipse
- ./gradlew cleanEclipse eclipse
- apply plugin: 'eclipse'

##### Use [IDEA or Eclipse Gradle plugins to learn Gradle]
##### Script
- project.buildDir, projectDir


##### Misc
- [Change Gradle user home](http://mrhaki.blogspot.com/2010/09/gradle-goodness-changing-gradle-user.html)
- export GRADLE_USER_HOME=/gradle
- or add -g and --gradle-user-home to the gradle command
- export M2_HOME=/m2

- gradle -d -r

##### References
- [Gradle Tips and Tricks](https://lifelongprogrammer.blogspot.com/2017/10/gradle-tips-and-tricks-2017.html)
