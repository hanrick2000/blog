<!-- /2018/03/tools-troubleshooting-skills.html -->
#### Linux
##### [crash or reboot?](https://serverfault.com/questions/789442/how-can-you-distinguish-between-a-crash-and-a-reboot-on-rhel7)
ast -n2 -x shutdown reboot
- If this reports a SYSTEM_SHUTDOWN followed by a SYSTEM_BOOT, all is well; however, if it reports 2 SYSTEM_BOOT lines in a row, then clearly the system did not shutdown gracefully

host $ip

##### Write Troubleshooting Friendly Program
- Name your thread


