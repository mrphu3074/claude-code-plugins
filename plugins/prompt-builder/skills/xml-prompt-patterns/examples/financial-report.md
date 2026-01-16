# Financial Report Prompt Example

A complete, ready-to-use prompt for generating financial reports.

## Prompt

```xml
You're a financial analyst at AcmeCorp. Generate a Q2 financial report for our investors.

<company-context>
AcmeCorp is a B2B SaaS company. Our investors value transparency and actionable insights.
</company-context>

<data>
{{SPREADSHEET_DATA}}
</data>

<instructions>
1. Include sections: Revenue Growth, Profit Margins, Cash Flow
2. Highlight strengths and areas for improvement
3. Compare metrics to Q1 where applicable
4. Identify trends and provide forward-looking insights
</instructions>

<constraints>
- Keep the report concise and scannable
- Use list format for easy reading
- Include specific numbers with direction indicators
- Limit to key metrics that matter to investors
</constraints>

<formatting-example>
Revenue Growth:
- Q2 revenue: $15.2M (22% YoY ↑)
- Enterprise clients: 30% ↑
- SMB segment: 5% ↓
  Action: Targeted Q3 marketing

Profit Margins:
- Gross margin: 72% (3% ↑ from Q1)
  Reason: Infrastructure optimizations
</formatting-example>

<output-format>
Structure your response with these sections:
- Revenue Growth
- Profit Margins
- Cash Flow
- Outlook

End with a brief management statement (2-3 sentences).
</output-format>
```

## Why This Works

1. **Role Context**: Sets up the analyst persona for appropriate tone
2. **Company Context**: Provides background for relevant insights
3. **Separated Data**: Clear placeholder for actual financial data
4. **Explicit Instructions**: Step-by-step guidance on what to include
5. **Constraints**: Prevents verbose or off-target responses
6. **Format Example**: Shows exactly the desired output style
7. **Output Structure**: Defines expected sections

## Customization Points

- Replace `{{SPREADSHEET_DATA}}` with actual financial data
- Adjust sections based on your reporting needs
- Modify formatting example to match your style guide
- Add or remove constraints as needed
