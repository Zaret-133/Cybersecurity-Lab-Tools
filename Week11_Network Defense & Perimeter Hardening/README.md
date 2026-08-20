<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=rect&color=0:071A2D,100:0B84B5&height=120&section=header&text=Week%2011%20-%20The%20Fortress&fontSize=35&fontColor=ffffff&fontAlignY=50" />
</p>

# 🏰 Week 11 — The Fortress

**Focus: Network Defense & Perimeter Hardening**

---

## 📌 Overview

Week 11 focused on network defense and perimeter hardening through a defense-in-depth approach. The labs moved from identifying vulnerabilities to implementing security controls designed to detect, restrict, and respond to malicious activity across the perimeter, network, and endpoint layers.

The week combined firewall engineering, network intrusion detection, and endpoint monitoring into a layered defensive architecture.

---

## 🎯 Lab Objective

Build and configure multiple layers of network defense to reduce attack exposure, monitor malicious activity, and detect suspicious behavior across network and endpoint environments.

---

## 🧠 Skills Developed

* Defense-in-Depth Architecture
* Network Segmentation
* DMZ Architecture
* Firewall Configuration
* Egress Filtering
* Network Intrusion Detection
* IDS Signature Creation
* Security Alert Analysis
* Endpoint Monitoring
* Process & Command-Line Tracking
* Ransomware Behavior Detection

---

## 🧰 Tools & Technologies

| Tool            | Purpose                            |
| --------------- | ---------------------------------- |
| Ubuntu Linux    | Defensive Workstation              |
| Docker          | DMZ Sandbox & IDS Containers       |
| UFW / iptables  | Firewall & Egress Filtering        |
| Suricata        | Network Intrusion Detection        |
| SysmonForLinux  | Endpoint Activity Monitoring       |
| PowerShell Core | Endpoint Configuration & Analysis  |
| XML             | EDR Detection Policy Configuration |

---

## 🏗️ Session 31 — The Barricade

Focused on perimeter security and network segmentation:

* Configured UFW and iptables firewall controls
* Practiced egress filtering
* Built a DMZ architecture using Docker subnets
* Isolated web-facing systems from internal resources
* Applied firewall rules designed to restrict unauthorized outbound communication

---

## 🪤 Session 32 — The Tripwire

Focused on network intrusion detection:

* Deployed Suricata as an IDS sensor
* Created custom IDS signatures
* Monitored network traffic for malicious payloads
* Reviewed Suricata `fast.log` alerts
* Practiced identifying activity that triggered detection rules

---

## 🔬 Session 33 — The Last Mile

Focused on endpoint monitoring and detection:

* Deployed SysmonForLinux
* Monitored process creation and command-line execution
* Examined endpoint activity for suspicious behavior
* Created an XML detection policy
* Practiced detecting ransomware precursor behavior

---

## 🛡️ Take-Home Lab — Operation Fortress

Operation Fortress combined the week's defensive controls into a unified Defense-in-Depth architecture.

The project incorporated:

* Egress firewall controls
* Custom Suricata IDS signatures
* Network alert monitoring
* SysmonForLinux endpoint monitoring
* XML-based EDR detection policy
* Ransomware behavior detection

The lab demonstrated how multiple security controls can work together across the perimeter, network, and endpoint layers rather than relying on a single defensive mechanism.

---

## 📂 Project Artifacts

Key artifacts produced during the project include:

```text
custom_ids.rules
edr_policy.xml
firewall_config.sh
```

These artifacts document the firewall, IDS, and endpoint-detection controls configured during the lab.

---

## 🏆 Key Takeaway

Week 11 provided hands-on experience building layered network defenses and demonstrated how firewall controls, IDS monitoring, and endpoint detection can work together to identify and restrict malicious activity.

Operation Fortress strengthened my understanding of defense-in-depth and gave me practical exposure to the types of network and endpoint security controls used in security operations environments.
