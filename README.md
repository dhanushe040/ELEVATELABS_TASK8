# ELEVATELABS_TASK8
🧠 MySQL Procedures and Functions – Employee & Customer Utilities
A practical collection of MySQL procedures and functions for managing employee records, updating locations, calculating discounts, and classifying customers based on credit or salary.

🔧 Procedures
🔍 EmployeeDetails
Fetches details of a specific employee using their ID. 📌 Example: Returns full record for employee ID 101.

📋 GetAllEMPDETAILS
Retrieves all employee records from the EMP table. 📌 Example: Displays all 12 employees with full details.

🛠️ UPDATELOC
Updates location to "BANGALORE" for employees matching the input location. 📌 Example: Input "COIMBATORE" updates relevant entries.

💰 MINSALARY
Returns the minimum salary from the EMP table. 📌 Output: 10000

🧮 Functions
🧾 calculate_discount
Calculates the discounted price based on original price and discount rate. 📌 Example: 1000 with 10% discount returns 900.00

🏷️ CustomerLEVEL
Classifies customers into tiers based on credit:

🥇 PLATINUM → credit > 50000

🥈 GOLD → credit ≥ 10000

🥉 SILVER → credit < 10000

📌 Example: Credit 30000 returns GOLD

📌 Applied to employee salaries:

👤 Employee Name	🏆 Level
Rajaram Sundaram	GOLD
Abinaya Krishnamoorthy	GOLD
Naveen Chidambaram	GOLD
Shabeer Salman Khan	GOLD
Sureshkumar Venkatesan	GOLD
Gayathri Srinivasan	PLATINUM
Anu Rajagopal	GOLD
Ashokumar Maheswaran	GOLD
Charles Joseph	GOLD
Ashok Narayanan	GOLD
🚀 Highlights
Modular SQL logic for real-world use cases

Easy-to-understand procedures and functions

Ideal for dashboards, reporting, and learning SQL fundamentals
