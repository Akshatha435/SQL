# SQL

# 🍜 Danny's Diner SQL Case Study  

Welcome to my SQL solution for the **Danny’s Diner Case Study** from the [8 Week SQL Challenge](https://8weeksqlchallenge.com/case-study-1/).  
This project demonstrates how SQL can be used to generate valuable insights into **customer behavior, sales patterns, and loyalty programs** for a small restaurant.  

---

## 📖 Case Study Overview  
Danny runs a Japanese restaurant and wants to use data to better understand his customers:  
- How much are they spending?  
- How often do they visit?  
- What are their favorite dishes?  
- How do their habits change once they join the loyalty program?  

The dataset includes three tables:  

- **`sales`** – records of all customer purchases  
- **`menu`** – items available and their prices  
- **`members`** – information on loyalty program enrollment  

---

## ❓ Business Questions Solved  
✔️ What is the total amount spent by each customer?  
✔️ How many days has each customer visited the restaurant?  
✔️ What was the first item purchased by each customer after joining the loyalty program?  
✔️ What is the most purchased item on the menu, and who are the top customers for it?  
✔️ Which items did each customer purchase after becoming a member?  
✔️ What are the spending patterns before vs. after membership?  

---

## 🗂️ Project Structure  
SQL_Projects/
├── DannysDiner.sql # SQL queries & answers


└── README.md # Project documentation 




---

## 🛠️ Skills & Concepts Used  
- **SQL Joins** (INNER, LEFT)  
- **Aggregations** (`SUM`, `COUNT`, `AVG`)  
- **Subqueries**  
- **Common Table Expressions (CTEs)**  
- **Window Functions**  
- **Case Statements**  

---

## ⚙️ How to Run This Project  
1. Create the `sales`, `menu`, and `members` tables in your SQL environment (PostgreSQL, MySQL, or SQLite).  
2. Insert the sample data from the case study.  
3. Open the `DannysDiner.sql` file.  
4. Run the queries step by step to reproduce insights.  

---

## 📊 Key Insights  
🔹 **Customer A** is the highest spender overall.  
🔹 **Ramen** is the most popular menu item.  
🔹 Loyalty members tend to try new items after joining, showing increased engagement.  
🔹 Certain customers became more frequent visitors once enrolled in the program.  

---

## 📸 Sample Output (Example)  
| customer_id | total_spent | total_visits | favorite_item |
|-------------|-------------|---------------|---------------|
| A           | $76         | 5             | Ramen         |
| B           | $74         | 6             | Curry         |
| C           | $36         | 2             | Sushi         |

---

## 📌 Reference  
- 📂 Case Study Source: [8 Week SQL Challenge – Case Study #1](https://8weeksqlchallenge.com/case-study-1/)  
- 🙏 Inspired by Danny Ma’s SQL learning community.  

---

## ✨ About This Project  
This project showcases my ability to:  
- Write **clean, modular SQL queries**  
- Transform **business questions into SQL logic**  
- Present **data insights in a business-friendly format**  

---

