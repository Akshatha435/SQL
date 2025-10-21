# 🏦 Case Study #4: Data Bank
<img src="https://user-images.githubusercontent.com/81607668/127727503-9d9e7a25-93cb-4f95-8bd0-20b87cb4b459.png" alt="Image" width="500" height="520">

## 📚 Table of Contents
- [Business Task](#business-task)
- [Entity Relationship Diagram](#entity-relationship-diagram)
- [Question and Solution](#question-and-solution)

Please note that all information regarding the case study has been sourced and adapted from [here](https://8weeksqlchallenge.com/case-study-4/).

***

## Business Task
Danny created a digital bank — **Data Bank** — where customers can store money, transfer funds, and earn interest.  
He wants insights into customer balances, regions, transactions, and engagement patterns to improve services.

***

## Entity Relationship Diagram

![image](https://user-images.githubusercontent.com/81607668/127271130-dca9aedd-4ca9-4ed8-b6ec-1e1920dca4a8.png)

Key Tables:
- `regions` — stores region_id and region_name  
- `customers` — customer details (id, name, region_id, account_open_date)  
- `transactions` — customer transactions (txn_id, customer_id, txn_date, txn_type, amount)

***

## Question and Solution

---

### **1. How many unique customers exist per region?**

```sql
SELECT 
    r.region_name, 
    COUNT(DISTINCT c.customer_id) AS total_customers
FROM customers c
JOIN regions r 
  ON c.region_id = r.region_id
GROUP BY r.region_name
ORDER BY total_customers DESC;

**2. What is the total balance across all customers per region?**
SELECT 
    r.region_name,
    SUM(c.balance) AS total_balance
FROM customers c
JOIN regions r 
  ON c.region_id = r.region_id
GROUP BY r.region_name
ORDER BY total_balance DESC;

3. What is the average number of transactions per customer?
SELECT 
    ROUND(COUNT(*) / COUNT(DISTINCT customer_id), 2) AS avg_txn_per_customer
FROM transactions;

4. Which transaction type is used most frequently?
SELECT 
    txn_type,
    COUNT(*) AS txn_count
FROM transactions
GROUP BY txn_type
ORDER BY txn_count DESC
LIMIT 1;

5. What is the total amount deposited vs withdrawn by all customers?
SELECT 
    txn_type,
    ROUND(SUM(amount), 2) AS total_amount
FROM transactions
WHERE txn_type IN ('deposit', 'withdrawal')
GROUP BY txn_type;

6. What is the average balance per customer per region?
SELECT 
    r.region_name,
    ROUND(AVG(c.balance), 2) AS avg_balance
FROM customers c
JOIN regions r 
  ON c.region_id = r.region_id
GROUP BY r.region_name
ORDER BY avg_balance DESC;

7. Which customers made the highest number of transactions?
SELECT 
    customer_id,
    COUNT(*) AS total_txns
FROM transactions
GROUP BY customer_id
ORDER BY total_txns DESC
LIMIT 5;

8. What is the total number of customers who never made a withdrawal?
SELECT 
    COUNT(DISTINCT c.customer_id) AS no_withdrawal_customers
FROM customers c
LEFT JOIN transactions t 
  ON c.customer_id = t.customer_id 
  AND t.txn_type = 'withdrawal'
WHERE t.customer_id IS NULL;

9. Which region shows the highest transaction volume overall?
SELECT 
    r.region_name,
    COUNT(t.txn_id) AS total_transactions
FROM transactions t
JOIN customers c 
  ON t.customer_id = c.customer_id
JOIN regions r 
  ON c.region_id = r.region_id
GROUP BY r.region_name
ORDER BY total_transactions DESC;

10. What is the overall net balance change (deposits - withdrawals)?
SELECT 
    ROUND(
      SUM(CASE WHEN txn_type = 'deposit' THEN amount 
               WHEN txn_type = 'withdrawal' THEN -amount 
               ELSE 0 END),
      2
    ) AS net_change
FROM transactions;

BONUS QUESTION: Which day of the week has the most transactions?
SELECT 
    DAYNAME(txn_date) AS day_name,
    COUNT(*) AS txn_count
FROM transactions
GROUP BY day_name
ORDER BY txn_count DESC;
