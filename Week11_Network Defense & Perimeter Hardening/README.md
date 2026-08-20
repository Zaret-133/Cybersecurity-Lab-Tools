<div align="center">

# Week 11 - Network Defense & Perimeter Security

</div>

## 🛡️ Week 11 — Network Defense & Perimeter Security

---

## 📌 Overview

This week focused on perimeter defense, network traffic inspection, intrusion detection, and endpoint hardening. The objective was to design, deploy, and validate multi-layered defensive controls—combining firewall rule automation, custom Intrusion Detection System (IDS) signatures, and Endpoint Detection and Response (EDR) policies to detect and mitigate malicious network activities.

---

## 🎯 Lab Objective

Learn how security engineers and SOC analysts construct perimeter defenses, inspect network telemetry, deploy automated firewall filtering rules, configure EDR enforcement policies, and engineer custom detection signatures to thwart active threats.

---

## 🧠 Skills Developed

* Perimeter Security & Defense-in-Depth
* Firewall Rule Automation & IPTables/UFW Configuration
* Intrusion Detection System (IDS/IPS) Signature Engineering
* EDR Policy Design & Host Protection
* Network Traffic Analysis & Telemetry Inspection
* Signature-Based Threat Detection
* Rule Testing & Validation Against Simulated Attacks

---

## 🧰 Tools & Technologies

| Tool / Technology | Purpose |
| :--- | :--- |
| **Linux Bash Shell** | Automated firewall provisioning and policy scripting (`firewall_config.sh`) |
| **Suricata / Snort** | Custom network intrusion detection signatures (`custom_ids.rules`) |
| **EDR Platform / XML** | Endpoint detection policy and process-monitoring rules (`edr_policy.xml`) |
| **TCPDump / Wireshark** | Packet capture and network traffic analysis |
| **IPTables / UFW** | Network layer packet filtering and perimeter control |

---

## 🚨 Defensive Modules & Implementation

* **Perimeter Defense & Firewall Automation (`firewall_config.sh`)**
  * Automated packet-filtering rules to block unauthorized inbound traffic and isolate high-risk subnets.
  * Restricted exposed ports and enforced default-deny egress/ingress policies.

* **Intrusion Detection Engineering (`custom_ids.rules`)**
  * Authored custom IDS/IPS detection signatures to catch malicious payload patterns, unauthorized port scans, and command-and-control (C2) traffic.
  * Tested rule specificity to minimize false positives while ensuring reliable alert triggers.

* **Endpoint Detection & Response Configuration (`edr_policy.xml`)**
  * Configured XML-based EDR rule sets to monitor suspicious parent-child process executions.
  * Implemented behavioral detection baselines to intercept privilege escalation and unauthorized file tampering.

* **Network Defense Operations (`Week11_Netwofense Operations`)**
  * Conducted end-to-end testing against active threat scenarios to validate detection coverage across both host and perimeter layers.

---

## 🏆 Key Takeaway

Week 11 delivered practical, engineering-focused experience in designing resilient network perimeters. It bridged the gap between passive network monitoring and active defense by writing actionable detection rules, enforcing strict firewall filters, and hardening endpoints against evasive adversary techniques.

---

## 📂 Repository Structure

```text
Week11_Network_Defense_Perimeter/
│
├── README.md
├── custom_ids.rules
├── edr_policy.xml
├── firewall_config.sh
└── Week11_Netwofense_Operations/
