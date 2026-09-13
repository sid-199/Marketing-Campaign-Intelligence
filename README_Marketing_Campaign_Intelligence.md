# 📊 Marketing Campaign Intelligence

> **Data-Driven Marketing Performance & Strategy**  
> A Power BI portfolio project comparing marketing campaign performance across brands, campaign types, channel combinations, customer segments, and target audiences.

---

## 🚀 Project Overview

Marketing teams usually have a lot of campaign data, but the real challenge is turning that data into useful business insights.

This project brings campaign data for **Nykaa, Purplle, and Tira** into one standardized BI model. Instead of reviewing each brand separately, the dashboard makes it easier to compare performance using the same metrics and business dimensions.

### 🔄 Project Workflow

**Dataset → 🧹 Data Validation → 🐬 SQL Analysis → 🗃️ Master Table → 📊 Power BI Model → 📈 Dashboard → 💡 Insights → 💼 Recommendations**

> ⚠️ **Important:** This is a **synthetic dataset**. The results are useful for demonstrating analysis and comparison, but they should not be treated as real industry benchmarks.

---

## 🎯 Business Problem

Marketing campaign reports can be difficult to compare when brands and campaigns are reviewed separately.

The project focuses on questions such as:

- 🔎 Which brand is performing better overall?
- 📈 Which campaign types generate better returns?
- 💰 Which campaigns are relatively more cost-efficient?
- 🔗 Which channel combinations have higher ROI?
- 👥 Which customer segments perform better?
- 🎯 Which target audiences show stronger results?
- 📅 How does ROI change over time?

The solution is to create **one standardized analytical view** for all three brands.

---

## 🎯 Project Objectives

- 🧹 Validate and prepare the campaign data.
- 🗃️ Combine the three brand datasets into one master table.
- 🧮 Use SQL for business and campaign analysis.
- 📊 Build an interactive Power BI dashboard.
- 🔍 Compare brands, campaign types, channel combinations, customer segments, and target audiences.
- 📅 Analyze monthly ROI and performance trends.
- 💡 Convert the analysis into meaningful business insights.
- ✅ Provide recommendations based on the findings.

---

## 📦 Dataset

| 🏷️ Brand | 📋 Records |
|---|---:|
| Nykaa | 55,555 |
| Purplle | 55,555 |
| Tira | 55,555 |
| **Total** | **166,665** |

📅 **Data Period:** July 2024 – June 2025  
🏢 **Brands:** 3  
📣 **Campaign Types:** 5

### 🔑 Main Columns

`Campaign_ID` · `Campaign_Type` · `Target_Audience` · `Duration` · `Channel_Used` · `Impressions` · `Clicks` · `Leads` · `Conversions` · `Revenue` · `Acquisition_Cost` · `ROI` · `Language` · `Engagement_Score` · `Customer_Segment` · `Date`

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| 🐬 **MySQL** | Data validation, SQL analysis and master table creation |
| 📊 **Power BI** | Interactive dashboard and reporting |
| 🔄 **Power Query** | Data preparation |
| 📐 **DAX** | Measures and date table |
| 🐙 **Git & GitHub** | Version control and portfolio presentation |

---

# 🔧 Technical Approach

## 1️⃣ Data Validation

Before starting the analysis, SQL was used to check:

- Duplicate Campaign IDs
- NULL / missing values
- Date ranges
- Minimum values of numerical columns
- Record counts for each brand

The validation described in the project found **no duplicate Campaign IDs and no important missing values**.

Negative ROI values were retained because they can represent loss-making campaigns.

---

## 2️⃣ Creating the Master Table

Three source tables were combined:

```text
nykaa_campaigns
purplle_campaigns
tira_campaigns
        ↓
marketing_campaigns
```

A `Brand` column was added so the same SQL queries and Power BI model could be used for all three brands.

---

## 3️⃣ SQL Analysis

SQL was used to analyze:

- 🏢 Overall brand performance
- 🔗 Channel combinations
- 📣 Campaign types
- 👥 Customer segments
- 🎯 Target audiences
- 🔎 Purplle's College Students segment
- 📅 Monthly performance
- 🔄 Conversion rate
- 💵 Cost per conversion
- 💰 ROAS

### 🔗 Channel Combination Handling

Values such as:

```text
WhatsApp, Email, Facebook
```

were treated as **one channel combination** rather than splitting the campaign into three channels.

This avoids double-counting campaign revenue and conversions.

---

## 4️⃣ Power BI Data Model

A DAX `DateTable` was created with:

`Date` · `Year` · `Month` · `Month Number` · `Year Month` · `Year Month Sort`

### 🔗 Relationship

```text
DateTable[Date]
       1
       │
       ▼
marketing_campaigns[Date]
       ∞
```

---

## 5️⃣ DAX Measures

### 💰 Total Revenue

```DAX
Total Revenue =
SUM(marketing_campaigns[Revenue])
```

### 💸 Total Acquisition Cost

```DAX
Total Acquisition Cost =
SUM(marketing_campaigns[Acquisition_Cost])
```

### 📈 Average ROI

```DAX
Average ROI =
AVERAGE(marketing_campaigns[ROI])
```

### 🔄 Conversion Rate

```DAX
Conversion Rate =
DIVIDE(
    [Total Conversions],
    [Total Leads],
    0
)
```

### 💵 Cost Per Conversion

```DAX
Cost Per Conversion =
DIVIDE(
    [Total Acquisition Cost],
    [Total Conversions],
    0
)
```

Other measures include **Total Impressions, Total Clicks, Total Leads, Total Conversions, Total Campaigns**, and a **Best Campaign** measure.

---

# 📊 Power BI Dashboard

The dashboard contains **4 pages**:

| Page | Purpose |
|---|---|
| 🏠 **Home** | Project introduction and navigation |
| 📌 **Overview** | Management-level performance summary |
| 📣 **Campaign Performance** | Campaign type and channel analysis |
| 👥 **Customer VS Targeting Insights** | Customer and targeting analysis |

### 🏠 Home

Shows:

- 🏢 3 Brands
- 📋 166.67K Campaign Records
- 📣 5 Campaign Types
- 📅 2024-07 to 2025-06

### 📌 Overview

Includes:

- 💰 Total Revenue
- 💸 Total Acquisition Cost
- 📈 Average ROI
- 🔄 Conversion Rate
- 👥 Total Leads
- ✅ Total Conversions
- Campaign Investment vs Revenue
- Brand Performance Scorecard
- Monthly ROI Trend

### 📣 Campaign Performance

Includes:

- 📋 Campaign Type Performance Scorecard
- 🏆 Best Campaign
- 🔗 Top 5 Channel Combinations by ROI
- 💵 Cost Per Conversion by Campaign Type & Brand

### 👥 Customer VS Targeting Insights

Includes:

- 🎯 Average ROI by Target Audience & Brand
- 📅 Monthly ROI Trend by Brand
- 🗣️ Most Used Campaign Language
- 👥 Average ROI by Customer Segment & Brand
- 🔎 Target Audience vs Customer Segment ROI

> 🗣️ **Language** represents the language used in campaigns, not the most spoken language of customers.

---

# 💡 Key Insights

## 🥇 1. Nykaa has the strongest overall performance

| Brand | Revenue | Acquisition Cost | ROI |
|---|---:|---:|---:|
| 🥇 Nykaa | 5.75bn | 4.15M | **2.75** |
| 🥈 Purplle | 5.70bn | 4.18M | **2.69** |
| 🥉 Tira | 5.65bn | 4.07M | **2.68** |

Nykaa has the highest overall revenue and average ROI. However, the difference is relatively small, so this is better viewed as a **performance lead**, not a major gap.

---

## 📣 2. Paid Ads is the strongest overall campaign type

| Campaign Type | ROI |
|---|---:|
| 🥇 Paid Ads | **2.71** |
| Social Media | **2.71** |
| Email | 2.69 |
| SEO | 2.69 |
| Influencer | 2.65 |

Paid Ads is displayed as the **Best Campaign**.

Conversion rates are also close to 55% across campaign types, so the ROI difference is not explained by a large conversion-rate gap alone.

---

## 🔗 3. Channel performance differs by brand

Examples from the SQL analysis:

- 🩷 **Nykaa:** WhatsApp, Email, Facebook — ROI around **4.23**
- 💙 **Purplle:** Facebook, Email, YouTube — ROI around **3.52**
- 🟣 **Tira:** WhatsApp, Instagram, Google — ROI around **3.73**

This suggests that one common channel strategy may not work equally well for every brand.

---

## 👥 4. Each brand has a different high-performing customer segment

| Brand | Strongest Customer Segment |
|---|---|
| Nykaa | **Working Women** |
| Purplle | **College Students** |
| Tira | **Youth** |

This supports a more brand-specific approach to campaign planning.

---

## 🎯 5. Target audience performance differs by brand

| Brand | Strongest Target Audience |
|---|---|
| Nykaa | **Premium Shoppers** |
| Purplle | **Youth** |
| Tira | **Tier 2 City Customers** |

---

## 🔎 6. Purplle shows a potential targeting-strategy gap

Purplle's **College Students** customer segment has the highest overall customer-segment ROI.

However, within this segment:

- Tier 2 City Customers — **2.830 ROI**
- Premium Shoppers — **2.822 ROI**
- Youth — **2.764 ROI**
- College Students — **2.664 ROI**
- Working Women — **2.640 ROI**

This does **not** mean Purplle is targeting the wrong audience.

A better interpretation is that there may be a **targeting-strategy gap**. Purplle could test different targeting approaches to understand how to reach the College Students segment more effectively.

---

## 📅 7. ROI changes over time

The monthly ROI charts show different performance patterns for the three brands from **July 2024 to June 2025**.

This shows why a full-period average should not be the only metric used for performance review.

---

## 🔄 8. Conversion rate is relatively stable

The Overview page shows an overall conversion rate of **54.90%**.

Campaign-type conversion rates are generally close to **55%**.

Therefore, ROI, revenue, acquisition cost, and conversions should be considered together when comparing campaign performance.

---

# 💼 Business Recommendations

### 💰 1. Test strong campaign types

Paid Ads and Social Media are among the strongest campaign types by ROI. They can be considered for **controlled budget experiments** rather than blindly increasing spending.

### 🔗 2. Use brand-specific channel combinations

The strongest channel combinations differ by brand. Campaign planning should therefore consider the **brand-specific channel mix**.

### 👥 3. Use customer segments for campaign testing

Each brand has a different high-performing customer segment. These segments can be used as starting points for focused campaign experiments.

### 🎯 4. Investigate Purplle's College Students segment

Purplle can test different audience definitions, messaging, and targeting combinations within the College Students segment.

### 📅 5. Include monthly trends in budget reviews

Monthly ROI should be reviewed before major budget decisions because overall averages can hide weaker or stronger periods.

### 💵 6. Look at cost together with ROI

A better performance review should consider:

**Revenue + Acquisition Cost + Conversions + ROI**

rather than relying on one metric alone.

---

# ⚠️ Important Limitations

- 🧪 The dataset is **synthetic**.
- 💰 ROAS values are extremely high because of the synthetic data and should mainly be used for comparison within the project.
- 💵 Cost per conversion is also best used for relative comparison.
- 🔍 The analysis identifies patterns but does not prove **causation**.
- 🔗 Channel combinations were kept together to avoid double-counting.
- 🗣️ Campaign Language represents the language used in campaigns.
- ⭐ Dashboard stars represent relative ROI ranking, not customer ratings.

---

# 📁 Repository Structure

```text
Marketing-Campaign-Intelligence/
│
├── 📂 Dataset/
|   └── 📄 marketing_campaigns_full.csv
|
├── 📂 SQL/
│   └── 📄 marketing_analysis.sql
│
├── 📂 PowerBI/
│   └── 📊 Marketing Campaign Dashboard.pbix
│
├── 📂 Screenshots/
│   ├── 🖼️ Home.png
│   ├── 🖼️ Executive_Overview.png
│   ├── 🖼️ Campaign_Performance.png
│   └── 🖼️ Customer_Targeting.png
│
├── 📄 Report.pdf
└── 📄 README.md

```

---

# 📌 Project Outcome

The final dashboard brings together:

**Brand Performance + Campaign Performance + Channel Analysis + Customer Segments + Targeting + Monthly Trends**

The main learning from this project was that a dashboard is not only about creating charts. The important part is understanding the **business requirements**, validating the data, selecting useful metrics, finding meaningful insights, and explaining what those insights could mean for a business.

### 👨‍💻 Skills Demonstrated

`SQL` · `Data Cleaning` · `Data Validation` · `MySQL` · `Power BI` · `Power Query` · `DAX` · `Data Modelling` · `Dashboard Development` · `Data Visualization` · `Business Analysis` · `Business Insights`

---

### ⭐ Thanks for checking out the project!

