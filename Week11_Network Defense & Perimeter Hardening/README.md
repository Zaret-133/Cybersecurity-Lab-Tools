<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=rect&color=0:071A2D,100:0B84B5&height=120&section=header&text=Week%2011%20-%20Network%20Defense%20%26%20Perimeter&fontSize=32&fontColor=ffffff&fontAlignY=50" />
</p>

# 🛡️ Week 11 — Network Defense & Perimeter Security

---

# 📌 Overview

This week focused on perimeter defense, network traffic inspection, intrusion detection, and endpoint hardening. The objective was to design, deploy, and validate multi-layered defensive controls—combining firewall rule automation, custom Intrusion Detection System (IDS) signatures, and Endpoint Detection and Response (EDR) policies to detect and mitigate malicious network activities.

---

# 🎯 Lab Objective

Learn how security engineers and SOC analysts construct perimeter defenses, inspect network telemetry, deploy automated firewall filtering rules, configure EDR enforcement policies, and engineer custom detection signatures to thwart active threats.

---

# 🧠 Skills Developed

- Perimeter Security & Defense-in-Depth
- Firewall Rule Automation & IPTables/UFW Configuration
- Intrusion Detection System (IDS/IPS) Signature Engineering
- EDR Policy Design & Host Protection
- Network Traffic Analysis & Telemetry Inspection
- Signature-Based Threat Detection
- Rule Testing & Validation Against Simulated Attacks

---

# 🧰 Tools & Technologies

| Tool | Purpose |
|------|----------|
| Linux Bash Shell | Automated Firewall Provisioning (`firewall_config.sh`) |
| Suricata / Snort | Custom IDS Signatures (`custom_ids.rules`) |
| EDR Platform / XML | Host Protection & Process Auditing (`edr_policy.xml`) |
| TCPDump / Wireshark | Packet Capture & Network Traffic Analysis |
| IPTables / UFW | Network Layer Packet Filtering & Perimeter Control |

---

# 🧱 Core Defensive Modules

### 1. Perimeter Defense & Firewall Automation (`firewall_config.sh`)
- Automated packet-filtering rules to drop unauthorized inbound traffic and isolate high-risk subnets.
- Restricted exposed ports and enforced strict default-deny egress/ingress policies.

### 2. Intrusion Detection Engineering (`custom_ids.rules`)
- Authored custom IDS/IPS detection signatures to catch malicious payload patterns, port sweeps, and C2 traffic.
- Tested rule specificity to minimize false positives while maintaining high detection fidelity.

### 3. Endpoint Detection & Response (`edr_policy.xml`)
- Configured XML-based EDR rule sets to monitor suspicious parent-child process relationships.
- Implemented behavioral detection baselines to intercept privilege escalation and unauthorized file tampering.

---

# 🔍 Network Defense Operations

Executed active defensive testing and telemetry validation:
- Validated firewall rule execution against simulated scanning activity.
- Triggered custom IDS signatures and analyzed resulting alert logs.
- Confirmed host containment and behavioral blocking through EDR policy enforcement.

---

# 🏆 Key Takeaway

Week 11 delivered practical, engineering-focused experience in designing resilient network perimeters. It bridged the gap between passive network monitoring and active defense by writing actionable detection rules, enforcing strict firewall filters, and hardening endpoints against evasive adversary techniques.

---

# 📂 Repository Structure

```bash
Week11_Network_Defense_Perimeter/
│
├── README.md
├── custom_ids.rules
├── edr_policy.xml
├── firewall_config.sh
└── Week11_Netwofense_Operations/
