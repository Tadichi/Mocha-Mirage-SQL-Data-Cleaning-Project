# ☕ Mocha Mirage SQL Data Cleaning Project

## 📌 Project Overview
Mocha Mirage is a specialty coffee chain known for its **premium coffee blends and exceptional customer experience**. As the company scales, maintaining **accurate sales data** becomes critical for **business intelligence (BI), sales forecasting, and operational efficiency**.

However, the raw sales dataset contained:
- **Duplicate transactions**
- **Missing and inconsistent values**
- **Erroneous data entries**
- **System-generated errors (e.g., "ERROR", "UNKNOWN")**

### 🛠️ **Project Goal**
To **clean, standardize, and optimize** the sales dataset using **SQL**, making it **analytics-ready** for accurate insights and reporting.

---

## 🏗️ **Project Workflow: Data Cleaning Process**
This project follows a structured **ETL (Extract, Transform, Load) workflow** to ensure data integrity.

### **1️⃣ Data Ingestion & Initial Assessment**
- **Created a staging table** to preserve the raw dataset.
- Conducted **exploratory data analysis (EDA)** to identify key issues.

👉 **[View Full SQL Queries Here](https://github.com/Tadichi/Mocha-Mirage-SQL-Data-Cleaning-Project/blob/main/Cafe_sales_query.sql)**

---

### **2️⃣ Removing Duplicates**
- Identified and removed duplicate `Transaction_ID`s that inflated sales metrics.
- Ensured each transaction was **unique** and **accurate**.

---

### **3️⃣ Standardizing Data**
- Standardized **Item Names, Locations, and Payment Methods**.
- Ensured **consistent pricing** across items by normalizing `Price_Per_Unit`.

---

### **4️⃣ Handling Missing & Erroneous Data**
- **Filled missing `Item` values** using reference data.
- **Restored missing `Price_Per_Unit`** by mapping based on item category.
- **Calculated missing `Quantity` & `Total_Spent`** based on available data.

---

### **5️⃣ Removing Unwanted Data**
- **Deleted incomplete transactions** that lacked crucial details.
- **Eliminated system-generated errors** (`ERROR`, `UNKNOWN`).
- **Removed NULL values** in `Payment_Method` and `Location`.

---

### **6️⃣ Creating a Clean Data View**
- Generated a **structured, analysis-ready dataset** using SQL Views.

👉 **[Download Cleaned Data (CSV)](https://github.com/Tadichi/Mocha-Mirage-SQL-Data-Cleaning-Project/blob/main/Cleaned%20Data.csv)**

---

## 📊 **Insights Gained**
✅ **Duplicate transactions overstated revenue** by ~5%.  
✅ **Pricing inconsistencies led to incorrect cost analysis**.  
✅ **System errors contributed to 2% of erroneous sales data**.  
✅ **Data cleaning enabled accurate revenue tracking** for Mocha Mirage.  

---

## 🚀 **Key Takeaways**
🔹 **Data Quality Drives Business Intelligence** – Cleaning data **before analysis** ensures **accurate decision-making**.  
🔹 **Automate Data Cleaning** – Using **SQL procedures** can improve efficiency in **data governance**.  
🔹 **Missing Data Needs Strategic Handling** – Understanding **business logic** is critical before filling missing values.  
🔹 **Outlier Detection Requires Domain Knowledge** – Some anomalies may need **business context** before being removed.  

---

## 🚧 **Limitations & Considerations**
⚠️ **Assumptions in Missing Data Handling** – Inferred missing `Price_Per_Unit` and `Quantity` may introduce slight variances.  
⚠️ **Potential Outliers Not Fully Analyzed** – Further statistical analysis is needed for robust **outlier detection**.  

---

## 📂 **Files Included**
📌 **[mocha_mirage_data_cleaning.sql](https://github.com/Tadichi/Mocha-Mirage-SQL-Data-Cleaning-Project/blob/main/Cafe_sales_query.sql)** – Full SQL script for data cleaning steps.  
📌 **[data_before_after.csv](https://github.com/Tadichi/Mocha-Mirage-SQL-Data-Cleaning-Project/blob/main/dirty_cafe_sales.csv)** – Sample dataset before & after cleaning.  

---


💬 Let’s Connect!
If you’re working on SQL-based data cleaning, ETL, or analytics, let’s collaborate! Feel free to fork this project, suggest improvements, or drop your thoughts in the discussions.

👉 Follow me on LinkedIn: [[Tadiwanashe Chimbwero](https://www.linkedin.com/in/tadiwanashechimbwero/)]
👉 Check out more projects on GitHub: [Tadichi](https://github.com/Tadichi?tab=repositories)

#SQL #DataCleaning #DataAnalytics #MochaMirage #ETL #BI #DataGovernance 🚀









