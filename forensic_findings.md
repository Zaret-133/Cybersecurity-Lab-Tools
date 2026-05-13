# FORENSIC FINDINGS REPORT (THE MALWARE AUTOPSY)

### WHO:
* The threat actor handle mentioned in the recovered payload is Cyb3rPhantom.

### WHAT:
* The identified threats are the deleted executable Resume.exe (Inode 582) and the active hidden process rootkit_beacon.exe with PID: 4444.

### WHEN:
* The infection timestamp recorded inside the recovered malware is 2026-05-13 14:22:01 UTC.

### HOW:
* The malware describes its persistence mechanism as establishing a Registry Run Key (specifically HKCU\Software\Microsoft\Windows\CurrentVersion\Run) to ensure the rootkit executes automatically upon system reboot.
