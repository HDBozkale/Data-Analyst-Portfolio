## Hospital ER: Operational Efficiency & Patient Insights

This repository contains an end-to-end data analytics project focused on Hospital Emergency Room (ER) performance. The goal is to provide hospital administrators with actionable insights into patient wait times, admission patterns, and satisfaction levels using Power BI.

### 📊 Project Overview
The analysis explores a dataset of 9,216 patient records, focusing on key operational metrics to improve service delivery and resource allocation.

### 🛠️ Data Analytics Workflow (Power BI)

1. **Data Sourcing & Connection**
    * Connected directly to raw ER admission datasets containing patient demographics, department referrals, and timestamps.

2. **Data Transformation (Power Query)**
    * Handled missing values in Satisfaction Scores and Department Referrals using Power Query transformations.
    * Standardized patient demographic data (Gender, Race, Age) to ensure accurate grouping.
    * Changed data types for "Patient Admission Date" to enable time-series analysis.

3. **Exploratory Data Analysis (EDA)**
    * **Patient Volume:** Monitored admission trends over time to identify peak ER hours.
    * **Demographic Breakdown:** Analyzed ER usage across different age groups and ethnicities.
    * **Referral Impact:** Evaluated which departments (General Practice, Orthopedics, etc.) drive the most ER traffic[cite: 1].

4. **Data Visualization & Dashboarding**
    * Developed an interactive **Power BI** dashboard to track ER performance metrics.
    * Created visual correlations between patient wait times and satisfaction scores.
    * Utilized slicers for dynamic filtering by Gender, Race, and Admission Flag[cite: 1].

5. **Insight Generation & Reporting**
    * Identified critical wait-time thresholds that impact patient satisfaction.
    * Provided recommendations for staffing adjustments during identified peak admission periods.

### 🔧 Technical Stack
* **Tool:** Power BI (Power Query, DAX, Power BI Desktop)[cite: 1]
* **Data Source:** CSV/Excel[cite: 1]
* **Key Metrics:** Patient Waittime, Satisfaction Score, Admission Flag, Department Referral[cite: 1]

### 📈 Key Findings
* **Volume:** Analysis of 9,216 unique patient visits[cite: 1].
* **Wait Times:** Distribution analysis of wait times ranging from immediate care to peak delay periods[cite: 1].
* **Satisfaction:** Correlation mapping between wait duration and the average satisfaction score[cite: 1].
