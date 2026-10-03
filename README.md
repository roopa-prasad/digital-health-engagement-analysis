Beyond App Activity: Medication Reporting and Treatment Outcomes

Project overview
Digital health products often measure engagement through activity counts. This project investigates whether message activity and medication-reporting days are associated with treatment outcomes.

Research question
How do message activity and medication-reporting days relate to reatment success in a digital treatment-support programme?

 Dataset

Dataset title: User engagement in the tuberculosis treatment  support tools intervention and its impact on treatment outcomes:A secondary analysis of a pragmatic trial

Source: Dryad research data repository

Dataset DOI: https://doi.org/10.5061/dryad.x3ffbg7zj

Original CSV file:
engagement_dataset_updated_per_requirements_6.6.26.csv

Size: 277 participants and 25 original columns.

Description: De-identified participant data from a pragmatic randomized controlled trial of the Tuberculosis Treatment Support Tools (TB-TST) app. Variables include message activity, self-reported medication-reporting days and treatment outcomes.

This portfolio project is an exploratory secondary analysis of the published dataset. It examines associations and does not estimate the app's causal effect.

This is not a German patient dataset. Its relevance to German health-tech analytics is the approach: evaluating engagement alongside health-related behaviour, outcomes and missing data.

It includes participant characteristics, message counts,medication-reporting days and treatment outcomes.

This is not a German patient dataset. The project demonstrates an analytical approach relevant to digital health product teams.

Technologies
- PostgreSQL: data cleaning and analysis
- pgAdmin: importing data and running SQL
- Excel: charts and presentation of findings

Methods
1. Imported the CSV into a raw table.
2. Removed an accidentally imported header row.
3. Checked participant IDs, missing values and numeric ranges.
4. Created a clean view with consistent labels and data types.
5. Preserved missing values as NULL rather than treating them as zero.
6. Compared treatment success across activity and reporting groups.
7. Examined early treatment exit and missing-data patterns.
8. Compared message groups within medication-reporting groups.
9. Investigated the categories behind unsuccessful outcomes.
10. Exported results and created three comparison charts.

Treatment success rates use participants with known success classifications as the denominator.

Key findings
- Overall success was 81.6%: 208 of 255 participants with known outcomes. Another 22 had no usable success classification.
- Success rates were 71.1%, 88.1% and 94.1% across increasing  medication-reporting groups.
- Within each reporting group, the 6+ message group did not have  higher observed success than the 0–5 message group.
- Participants with missing activity data had 52.4% success,compared with 84.2% among those with activity data available,using known outcomes only.
- Of 47 outcomes classified as unsuccessful, 44 were recorded as lost to follow-up.

Interpretation
Message counts alone give an incomplete picture of patient outcomes. Product teams should examine activity alongside health-related behaviour, outcomes and missing data.

 Limitations
These comparisons show association, not causation.Medication reporting is self-reported and does not prove medication was taken. Reporting totals also depend on time in treatment. Missing reports do not necessarily mean missed
medication.

Lost to follow-up does not establish clinical deterioration.
