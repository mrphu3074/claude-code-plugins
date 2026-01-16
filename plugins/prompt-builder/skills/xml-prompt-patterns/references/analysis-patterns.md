# Analysis & Reports Patterns

Detailed XML tag patterns for financial analysis, data insights, and business reports.

## Financial Report Pattern

```xml
You're a financial analyst at {{COMPANY_NAME}}. Generate a {{PERIOD}} financial report for our investors.

<company-context>
{{COMPANY_NAME}} is a {{COMPANY_TYPE}}. Our investors value transparency and actionable insights.
</company-context>

<data>
{{SPREADSHEET_DATA}}
</data>

<instructions>
1. Include sections: Revenue Growth, Profit Margins, Cash Flow
2. Highlight strengths and areas for improvement
3. Compare to previous period where applicable
4. Identify trends and provide outlook
</instructions>

<formatting-example>
{{PREVIOUS_REPORT}}
</formatting-example>

<output-format>
Use concise, professional tone. Present in list format with:
- Key metric and value
- Direction indicator (↑/↓/→)
- Brief explanation or action item
</output-format>
```

### Output Example

```
Revenue Growth:
- Q2 revenue: $15.2M (22% YoY ↑)
- Enterprise clients: 30% ↑
- SMB segment: 5% ↓
  Action: Targeted Q3 marketing

Profit Margins:
- Gross margin: 72% (3% ↑ from Q1)
  Reason: Infrastructure optimizations
```

## Data Analysis Pattern

```xml
Analyze the following dataset and provide insights.

<dataset>
{{DATA}}
</dataset>

<analysis-goals>
1. {{GOAL_1}}
2. {{GOAL_2}}
3. {{GOAL_3}}
</analysis-goals>

<context>
{{BUSINESS_CONTEXT}}
</context>

<instructions>
1. Identify key patterns and trends
2. Highlight anomalies or outliers
3. Provide statistical summary where relevant
4. Connect findings to business implications
</instructions>

<output-structure>
Organize response using:
<summary> - Executive summary (2-3 sentences)
<key-findings> - Main discoveries with supporting data
<anomalies> - Unusual patterns requiring attention
<recommendations> - Actionable next steps
</output-structure>
```

## Business Intelligence Report Pattern

```xml
Generate a business intelligence report based on the following data.

<kpi-data>
{{KPI_METRICS}}
</kpi-data>

<historical-context>
{{PREVIOUS_PERIOD_DATA}}
</historical-context>

<business-objectives>
{{OBJECTIVES}}
</business-objectives>

<instructions>
1. Compare current KPIs against targets
2. Analyze trends over time
3. Identify drivers of performance changes
4. Recommend actions for underperforming areas
</instructions>

<report-sections>
1. Executive Summary
2. KPI Dashboard
3. Trend Analysis
4. Root Cause Analysis
5. Recommendations
</report-sections>
```

## Competitive Analysis Pattern

```xml
Conduct a competitive analysis for {{COMPANY_NAME}}.

<company-profile>
{{OUR_COMPANY_INFO}}
</company-profile>

<competitor-data>
{{COMPETITOR_INFO}}
</competitor-data>

<market-context>
{{MARKET_INFO}}
</market-context>

<analysis-dimensions>
- Product features
- Pricing strategy
- Market positioning
- Strengths and weaknesses
- Market share trends
</analysis-dimensions>

<instructions>
1. Compare across all analysis dimensions
2. Identify competitive advantages and gaps
3. Assess market opportunities and threats
4. Provide strategic recommendations
</instructions>

<output-format>
<competitive-matrix> - Side-by-side comparison
<swot-analysis> - Our position analysis
<opportunities> - Market opportunities
<strategic-recommendations> - Suggested actions
</output-format>
```

## Survey Analysis Pattern

```xml
Analyze the following survey results and provide insights.

<survey-data>
{{SURVEY_RESPONSES}}
</survey-data>

<survey-context>
Purpose: {{PURPOSE}}
Sample size: {{N}}
Response rate: {{RATE}}
Collection period: {{PERIOD}}
</survey-context>

<analysis-requirements>
1. Quantitative analysis of closed questions
2. Thematic analysis of open responses
3. Segment analysis (if demographic data available)
4. Statistical significance assessment
</analysis-requirements>

<instructions>
1. Summarize key findings from each question
2. Identify patterns across responses
3. Note any concerning trends
4. Provide actionable recommendations
</instructions>

<output-sections>
<executive-summary> - Top-level findings
<quantitative-results> - Statistical analysis
<qualitative-themes> - Open response themes
<segment-insights> - Group differences
<recommendations> - Suggested actions
</output-sections>
```

## Metrics Dashboard Pattern

```xml
Create a metrics summary for {{TEAM/DEPARTMENT}}.

<metrics>
{{CURRENT_METRICS}}
</metrics>

<targets>
{{TARGET_VALUES}}
</targets>

<previous-period>
{{LAST_PERIOD_METRICS}}
</previous-period>

<instructions>
For each metric:
1. Show current value vs target (% of target)
2. Show trend vs previous period
3. Provide status indicator (on-track, at-risk, off-track)
4. Note any required actions
</instructions>

<output-format>
| Metric | Current | Target | % | Trend | Status | Action |
|--------|---------|--------|---|-------|--------|--------|
</output-format>
```

## Risk Assessment Pattern

```xml
Conduct a risk assessment for {{PROJECT/INITIATIVE}}.

<project-details>
{{PROJECT_INFO}}
</project-details>

<known-risks>
{{IDENTIFIED_RISKS}}
</known-risks>

<historical-data>
{{PAST_INCIDENTS}}
</historical-data>

<instructions>
1. Evaluate each risk for likelihood and impact
2. Calculate risk score (likelihood × impact)
3. Prioritize risks by score
4. Develop mitigation strategies for high-priority risks
5. Identify monitoring triggers
</instructions>

<risk-matrix>
Likelihood: 1 (Rare) to 5 (Almost Certain)
Impact: 1 (Negligible) to 5 (Catastrophic)
Priority: High (15-25), Medium (8-14), Low (1-7)
</risk-matrix>

<output-format>
<risk-register>
| Risk | Likelihood | Impact | Score | Priority | Mitigation |
</risk-register>
<monitoring-plan> - Triggers and response procedures
<contingency-plans> - For highest priority risks
</output-format>
```

## Best Practices for Analysis Prompts

### Data Presentation
- Use `<data>` or `<dataset>` for raw data
- Specify data format when relevant (`format="csv"`, `format="json"`)
- Include data context (time period, source, limitations)

### Analysis Structure
- Define clear analysis goals upfront
- Specify dimensions or criteria for analysis
- Request structured output sections

### Output Control
- Use nested output tags for complex reports
- Request specific formats (tables, lists, metrics)
- Include formatting examples when style matters

### Context Provision
- Provide business context for relevant insights
- Include historical data for trend analysis
- Specify audience and purpose
