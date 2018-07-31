### Dealing with Service Failures
- Avoid Cascading Service Failures

### Graceful Degradation - reduced functionality.
- Graceful Backoff

### Fail as Early as Possible
Resource conservation
Responsiveness

### Building Systems with Reduced Risk
- Idempotent
- Simplicity
- Self-Repair

### Dependencies
- What do you do when a component you depend on fails? How do you retry? What do you do if the failure is an unrecoverable (hard) failure, rather than a recoverable (soft) failure?

### Customers
- What do you do when a component that is a customer of your system behaves poorly? Can you handle excessive load on your system? Can you throttle excessive traffic? Can you handle garbage data passed in? What about accidental or intentional Denial of Service (DoS) problems?

### Limit Scope
When there is a failure, it is often possible for part or even most of your system to continue to operate, even if part of your system is failing. What do you do to make sure a failure has the most limited scope possible? If a dependency fails, can you provide some value even if you cannot provide full services?

### Mitigate risk
- Determining where the risk is
- Determining which risk items must be removed and which are acceptable.
- Mitigating your remaining risk to reduce its likelihood and severity.
