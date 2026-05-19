# INCIDENT RESPONSE REPORT: OPERATION PHANTOM PURSUIT



## EXECUTIVE SUMMARY

On May 19, 2026, a critical security incident was identified on the enterprise network. A comprehensive investigation was initiated across the entire breach lifecycleâ€”spanning SIEM correlation, live asset triage, and deep-dive host disk forensics. The threat actor's entry point was successfully discovered, an active command-and-control connection was isolated, and a deleted malware payload was successfully recovered from unallocated disk space, ensuring full containment and evidence preservation.


---


## âš™ï¸ PHASE 1: SIEM CORRELATION & DETECTION

### Objective: Identify the initial access point and origin of the breach.


* **Detection Tool:** Kibana SIEM (Elasticsearch Log Analytics)

* **Configured Index Pattern:** `enterprise_logs*`

* **Search Query utilized:** `"Critical Alert"`

* **Attacker Source IP Address:** `198.51.100.44`

* **Analysis:** Log correlation confirmed that a `Critical Alert` was triggered by an unauthorized access event targeting an external-facing asset (`Web-01`). The entry point was isolated to a single network connection stemming directly from the rogue IP space listed above.


---


## âš™ï¸ PHASE 2: LIVE TRIAGE & CHAIN OF CUSTODY

### Objective: Quarantining the target machine, assessing live processes, and locking down evidence.


### 1. Active Threat Triage

* **Target Environment:** Containerized Host (`quarantined_host`)

* **Network Triage Command:** `netstat -antp`

* **Isolated Malicious Process ID (PID):** `11`

* **Associated Binary:** `nc` (Netcat reverse shell listener)

* **Target Port:** `4444` (Listening/Established)


### 2. Evidence Preservation (Chain of Custody)

* **Forensic Image Target:** `compromised_drive.dd`

* **Evidence Directory Path:** `~/DFIR_Evidence/`

* **Cryptographic Verification Tool:** SHA-256

* **Evidence SHA256 Hash:** `e1077fb1ab70f71281db814e2d6d855d9a5fc7da2f048358e6687aa160dbab4`


---


## âš™ï¸ PHASE 3: DIGITAL FORENSICS & DISK AUTOPSY

### Objective: Recovering deleted structural evidence using The Sleuth Kit (TSK).


### 1. Metadata Reconstruction

* **File System Scan Command:** `fls -r compromised_drive.dd`

* **Identified Malware Binary:** `beacon.exe` (Marked as unallocated/deleted file entry `*`)

* **Target Structural Inode Number:** `582`


### 2. Evidence Carving & Interrogation

* **Extraction Command:** `icat compromised_drive.dd 582 > recovered_payload.txt`

* **Analysis Toolkit:** `cat recovered_payload.txt` / `strings recovered_payload.txt`

* **Extracted Payload Contents:** `None (0-byte file / File structural entry contains zero data blocks)`

* **Forensic Conclusion:** The threat actor attempted to evade standard defense mechanisms by executing a manual file deletion protocol on `beacon.exe`. Forensic analysis verified that while the unallocated metadata remains associated with Inode `582`, the file content blocks evaluate to 0 bytes, indicating zero structural printable strings remain in this particular block cluster.


---


## í ½íº€ FINAL COMMAND SUMMARY

* **Incident Submission Tracker:** `session-submit --session tlab10 --artifact ~/Incident_Response_Report.md`

* **Repository Lifecycle Tracking:** Git Flow Execution completed to repository remote.
