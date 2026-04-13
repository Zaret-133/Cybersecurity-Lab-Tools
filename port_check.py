import socket

# This script checks common ports on your local server
target = "127.0.0.1"  # This means 'this machine'
ports_to_check = [21, 22, 80, 443, 445, 3389]

print(f"--- Starting Security Scan on {target} ---")

for port in ports_to_check:
    # Create a socket object
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # Set a timeout so it doesn't wait forever
    s.settimeout(1)
    
    # Try to connect to the port
    result = s.connect_ex((target, port))
    
    if result == 0:
        print(f"[!] Port {port}: OPEN")
    else:
        print(f"[-] Port {port}: CLOSED")
        
    s.close()

print("--- Scan Complete ---")
