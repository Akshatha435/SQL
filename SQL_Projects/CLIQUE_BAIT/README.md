# 💻 Case Study #5 — Clique Bait


## Entity Relationship Diagram  
![ERD – Clique Bait](https://8weeksqlchallenge.com/images/case-study-designs/5.png)

> The ER diagram below outlines relationships between customers, page events, campaigns, and website hierarchy.

---

Danny’s digital marketing team runs campaigns for multiple clients using the **Clique Bait** platform.  
This case study focuses on understanding **user behavior**, **campaign effectiveness**, and **website engagement patterns** through clickstream and conversion data.

---

📚 **Table of Contents**
- [Business Task](#business-task)
- [Entity Relationship Diagram](#entity-relationship-diagram)
- [Question and Solution](#question-and-solution)

---

## Business Task
This case study is part of the [8 Week SQL Challenge](https://8weeksqlchallenge.com/case-study-5/).  
The main goal is to use **SQL** to analyze:
- How customers interact with website pages  
- Which campaigns drive the most conversions  
- User journey and session engagement  
- Key performance insights from marketing data  

---

## Entity Relationship Diagram 
![ERD – CLIQUE BAIT](https://8weeksqlchallenge.com/images/case-study-3-erd.png)
---


## Question and Solution  

### **1️⃣ Which pages have the highest visit frequency?**  
```sql
SELECT page_name,
       COUNT(*) AS total_visits
FROM page_events
JOIN page_hierarchy USING(page_id)
GROUP BY page_name
ORDER BY total_visits DESC;
