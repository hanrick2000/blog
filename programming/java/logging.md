
- https://alibaba.github.io/Alibaba-Java-Coding-Guidelines/#logs
1. [Mandatory] Do not use API in log system (Log4j, Logback) directly. API in log framework SLF4J is recommended to use instead, which uses Facade pattern and is conducive to keep log processing consistent.

4. [Mandatory] Logs at TRACE/DEBUG/INFO levels must use either conditional outputs or placeholders.

5. [Mandatory] Ensure that additivity attribute of a Log4j logger is set to false, in order to avoid redundancy and save disk space.

6. [Mandatory] The exception information should contain two types of information: the context information and the exception stack. If you do not want to handle the exception, re-throw it.

- Positive example: `logger.error(various parameters or objects toString + "_" + e.getMessage(), e);`{.java}

8. [Recommended] Level Warn should be used to record invalid parameters, which is used to track data when problem occurs. Level Error only records the system logic error, abnormal and other important error messages.



