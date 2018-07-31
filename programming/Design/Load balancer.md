
- L3/4 Load Balancer
- SSL farm
- L7 load Balancer
<img src='https://lh6.googleusercontent.com/proxy/CCsgmpHYMgBcRc1g7EDqlJ9uR7mZaem-hrGO5m1_bB40nLMb8c3OGw8OewQM3Vr12nsiHo81U_-bx3kXoDKrwRZ5brpU7MdI5GDPl0VFy08n1XeC2FR_m6Q=s0-d' />

- SSL Termination

### 
- Round Robbin
- weighted round Robbin


### How to handle failed nodes
- retry on another node

- Elastic load-balancers can shut-down some of the servers during non-peak hours.

### Server Farm
- basically a set of identically configured machine, frontend by a load balancer
- stateless 
- horizontal scale
- more effective when combining with Cloud computing
  - easily add/remove servers
