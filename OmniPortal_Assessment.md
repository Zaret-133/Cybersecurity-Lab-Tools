# OMNI-PORTAL ASSESSMENT REPORT
**Operator:** **Deadline:** April 5 @ 11:59 PM 

## PHASE 1: AUTH BYPASS (SQLi)
* **Payload Used:** ' OR 1=1 --
* **Result:** Successfully bypassed login and obtained 'auth_token' cookie.

## PHASE 2: CLIENT-SIDE HIJACK (XSS)
* **Stored XSS Payload:** <script>alert(document.cookie);</script>
* **Secret Cookie Captured:** auth_token

## PHASE 3: API ENUMERATION (BOLA)
* **Insecure Order ID:** 501
* **Confidential Data Leaked:** Amount: $15,000.00 | Details: Confidential Server Lease

## PHASE 4: THE REMEDIATION
* **Fix for SQLi:** Implement Parameterized Queries / Prepared Statements. This forces the database to treat user inputs strictly as literal data parameters rather than executable code instructions, neutralising bypass logic completely.
* **Fix for XSS:** Implement Context-Aware Output Encoding and a strict Content Security Policy (CSP). Converting dangerous characters into inert HTML entities (e.g., changing < to &lt;) prevents the browser from interpreting stored forum comments as executable script blocks.
* **Fix for API BOLA:** Implement strict Object-Level Authorization Checks. The backend controller must check if the user context tied to the request session token matches the ownership record of the specific order_id in the database before returning any data. If it doesn't match, return a 403 Forbidden response.
