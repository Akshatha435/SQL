

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

create database Dannys_dinner;
use dannys_dinner;


## 1. What is the total amount each customer spent at the restaurant?
 select customer_id,sum(price) as total_spent from sales as s inner join menu m using (product_id) group by customer_id;

  ## 2. How many days has each customer visited the restaurant?
 select customer_id , count(distinct(order_date)) as no_of_visit from sales s group by customer_id;
 
  ## 2.1 how many times each customer visited the restauran?-- 
 select customer_id, count(customer_id) from sales as s group by customer_id;
 3. What was the first item from the menu purchased by each customer?
  select customer_id,product_name from (select *,row_number() over(partition by customer_id) as rn
  from sales s inner join menu m using(product_id)) as t where rn =1;

  ## 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
   p0- joins< p1- count+ group by< p2-order by desc< p3- limit 1
  select product_name, count( product_name) as no_of_times_purchase from sales  s inner join menu  m using (product_id) 
  group by product_name order by count(product_name) desc limit 1;
  
 ## 5. Which item was the most popular for each customer?
  joins> group by> rank()< add another query for where condition
 select customer_id,product_name,count(*) as popular_item ,dense_rank() 
 over(partition by customer_id order by count(*) desc) as drnk  from sales s inner join menu m using ( product_id)
 group by customer_id, product_name;
 
 
 select* from (select customer_id,product_name,count(*) as popular_item ,dense_rank() 
 over(partition by customer_id order by count(*) desc) as drnk  from sales s inner join menu m using ( product_id)
 group by customer_id, product_name) as t where drnk=1;
 
 ## 6. Which item was purchased first by the customer after they became a member?
 ###  joins> condition wr order_date is greater then joining_date>  condition- first_order> 
 
 select * from sales as s inner join menu as m using ( product_id) inner join members as mb on s.customer_id = mb.customer_id;# step 1
 select * from sales as s inner join menu as m using ( product_id) inner join members as mb on s.customer_id = mb.customer_id 
 and order_date > join_date ;# step 2
  select customer_id,order_date,join_date,product_name from (select s.customer_id,order_date,join_date,product_name, row_number() over (partition by s.customer_id order by order_date asc) as rn
  from sales as s inner join menu as m using ( product_id) inner join members as mb on s.customer_id = mb.customer_id 
 and order_date > join_date ) as t where rn =1;# step 3 we used windows fn 


 ## 7. Which item was purchased just before the customer became a member?
  select customer_id,order_date,join_date,product_name from (select s.customer_id,order_date,join_date,product_name,
  row_number() over (partition by s.customer_id order by order_date asc) as rn
  from sales as s inner join menu as m using ( product_id) inner join members as mb on s.customer_id = mb.customer_id 
 and order_date >= join_date ) as t where rn =1;
 
   select * from ( 
   select customer_id, order_date, rank() over(partition by s. customer_id order by order_date desc ) as rn 
  from sales s inner join menu m using( product_id) 
  inner join members mb on s.customer_id=mb.customer_id and s.order_date<mb.join_date) where rn =1;
 
 ## 8. What is the total items and amount spent for each member before they became a member?
 select s.customer_id,count(s.customer_id) as no_of_items, sum(price) as total_amount_spent  from sales s inner join menu m using(product_id)
 inner join members mb on s.customer_id =mb.customer_id and order_date < join_date group by  s. customer_id order by customer_id;
 
 ## 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
 select customer_id, sum(case when product_name ="sushi" then price*20 else price *10 end) as total_points
 from sales s inner join menu m using (product_id) group by customer_id;

## 📊 Key Insights  
🔹 **Customer A** is the highest spender overall.  
🔹 **Ramen** is the most popular menu item.  
🔹 Loyalty members tend to try new items after joining, showing increased engagement.  
🔹 Certain customers became more frequent visitors once enrolled in the program.  
 |
