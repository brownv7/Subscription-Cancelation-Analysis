# Subscription-Cancelation-Analysis - Reducing Customer Churn: Analysis Notes:


#  Executive Summary:

To mitigate significant revenue loss due to high customer churn, this analysis investigates user-reported cancellation reasons. The goal is to identify key drivers of churn and develop actionable recommendations to improve customer retention.

# Methodology:
![BDE Data Model](https://github.com/user-attachments/assets/4b3be928-f7a4-412a-b518-33c6fad85d8f)

* EDA
* Product Funnel Analysis
* Data Visualization


# Business Problem:

Company leadership has noticed a big churn problem this year which has had a large negative impact to revenue, so they're planning a company-wide retention effort. However, we don't currently have any insights or reporting into why people are churning, so the analytics team has decided to analyze the user-reported data collected in the cancelation workflow within the product to see if there are any trends as to why users are cancelling.

![image](https://github.com/user-attachments/assets/44485c9f-51eb-435a-8796-77000e92e7da)

## Skills

-   SQL
    -  CTEs, CASE, Union, View creation
-   Data visualization
-   Data Wrangling
-   Data Cleaning
-   Data Science Notebook
-   Snowflake Data warehouse

## Results & Business Recommendation:

**Results:**

-   **66.68% of users are selecting at least 1 additional cancelation reason** (beyond the first required one), but most users are not selecting all 3 which suggests lack of interest and frustration for the user.
-   **12.12% of users reported 'Not Useful' as the primary (first) cancelation reason**. The top choices for the primary reason were 'Expensive' and 'Went to a Competitor'.

![image](https://github.com/user-attachments/assets/dea7dbac-ccc0-4fab-bc82-09ad8d943586)
![image](https://github.com/user-attachments/assets/7fa8ed88-8e34-4afa-b79a-8a15b4bbabee)

-   Over time, here's how the cancelation reasons have changed: Cancellation rates have increased across all categories, with the most significant rise observed in "Bad Customer Service." Similar increases were noted for "Expensive" and "Not Useful." **Concurrently, the number of cancellations with "No Reason Provided" has decreased, suggesting that users are more frequently selecting specific reasons 2 and 3**.
  
![image](https://github.com/user-attachments/assets/fd5ee0b4-11fa-4c51-9cb3-e31507f27e6c)

  

**Business Recomendations:**

-   Since most users, have selected Expensive and Not Useful as the reasons to cancel, we should rollout better onboarding and provide more help early on in their subscription to ensure users and understanding the product and finding it useful. If they find the product more useful and valuable, they also many become less cost-sensitive to the value.
-   For cost conscious users, we could also launch a rescue tactic at the beginning of the cancelation workflow that offers them a large discount to stay and not cancel their subscription.
-   Since the most common cancelation reason for the secondary reason is Went to Competitor, we should research the market and ensure we're keeping up to date with industry trends.

## Next Steps:
-   Explore the engagement of canceled subscriptions and see how they interacted with the product. What features did they or did they not use? How often did they use the product? What if we compare them to non-cancelled subscriptions. Does anything stand out that could inform future retention efforts?

-   Work with the product manager to understand how we can improve the cancelation workflow by adding in rescue tactics and adding friction without increasing user frustration.
