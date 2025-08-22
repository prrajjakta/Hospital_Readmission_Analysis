# Hospital Readmission Analysis System

A comprehensive healthcare analytics project for tracking and reducing 30-day hospital readmission rates using MySQL and Tableau.

## 🏥 Project Overview

This project analyzes hospital readmission patterns to identify improvement opportunities and support quality initiatives. The system tracks key performance indicators and provides actionable insights for healthcare administrators.

### Key Metrics Tracked:
- 30-day readmission rates by diagnosis
- Length of stay trends
- Patient risk segmentation
- Financial impact analysis

## 🔧 Technology Stack

- **Database:** MySQL 8.0
- **Visualization:** Tableau Desktop/Public
- **Data Processing:** Python (pandas, numpy)
- **Version Control:** Git/GitHub

## 🚀 Quick Start

### Prerequisites
- MySQL Server 8.0+
- Tableau Desktop/Public
- MySQL ODBC Driver

### Setup Instructions
1.  **Clone Repository**
    ```bash
    git clone [https://github.com/prrajjakta/Hospital_Readmission_Analysis.git](https://github.com/prrajjakta/Hospital_Readmission_Analysis.git)
    cd Hospital_Readmission
    ```

2.  **Database Setup**
    ```sql
    -- Run the following commands sequentially in MySQL Workbench
    source sql/sql_1.sql;
    source sql/sql_2.sql;
    source sql/sql_3.1.sql;
    source sql/sql_3.sql;
    source sql/sql_4.1.sql;
    source sql/sql_4.2.sql;
    source sql/sql_4.3.sql;
    source sql/sql_4.4.sql;
    source sql/sql_4.5.sql;
    ```

3.  **Tableau Connection**
    - Open Tableau Desktop.
    - Connect to your MySQL database using the ODBC driver.
    - Open the Tableau workbook file: `tableau/visual1.twb`

## 📞 Contact

**Prajakta Padwalkar** - padwalkarprajakta14@gmail.com

Project Link: https://github.com/prrajjakta/Hospital_Readmission_Analysis