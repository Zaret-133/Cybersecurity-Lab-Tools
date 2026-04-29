# TITANCORP: PERIMETER ASSESSMENT REPORT
**Operator:** **Target Subnet:** 172.88.0.0/24

## PHASE 1: ACTIVE ENUMERATION (NMAP)
*(List the live IPs discovered and their running services/versions)*
* **Host 1 (172.88.0.28):** Apache httpd 2.4.66 (Debian) with OpenSSH 9.2p1 and Nginx on port 8443
* **Host 2 (172.88.0.44):** BusyBox httpd 1.13 with RTSP service (DoorBird video device)
* **Host 3 (172.88.0.80):** HTTP service (tcpwrapped - restricted or filtered access)

## PHASE 2: VULNERABILITY AUDIT (NIKTO)
*(Run Nikto against the TWO web servers discovered above. List one major finding for each.)*
* **Web Server 1 Finding:** Missing X-Frame-Options header allows clickjacking attacks on users interacting with the Apache web server (Nikto).
* **Web Server 2 Finding:** Outdated BusyBox HTTP server (v1.13) increases risk of exploitation due to known vulnerabilities in legacy embedded web services (Nikto/Nmap).

## PHASE 3: RISK TRIAGE
*(Review your findings. Identify the SINGLE highest-risk vulnerability across the entire DMZ. Justify why it is the top priority using the Likelihood x Impact formula.)*

* **Top Priority Remediation:** Internet-facing Apache web server (172.88.0.28) with multiple exposed services and missing security protections.
* **Justification:** This is the highest risk because it is publicly accessible with multiple open ports (HTTP, HTTPS, SSH), increasing the likelihood of attack, and successful exploitation could lead to full system compromise and impact critical services.
