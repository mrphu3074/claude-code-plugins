# Contract Analysis Prompt Example

A complete, ready-to-use prompt for analyzing legal contracts.

## Prompt

```xml
Analyze this software licensing agreement for legal risks and liabilities.

<context>
We're a multinational enterprise considering this agreement for our core data infrastructure.
Industry: Financial services
Risk tolerance: Low
Standard contract type: Enterprise SaaS
</context>

<agreement>
{{CONTRACT_TEXT}}
</agreement>

<standard-contract>
This is our standard contract for reference:
{{STANDARD_CONTRACT}}
</standard-contract>

<instructions>
1. Analyze these clauses in detail:
   - Indemnification
   - Limitation of liability
   - IP ownership
   - Data handling and privacy
   - Termination conditions
   - Service level agreements

2. Note any unusual or concerning terms not covered above

3. Compare each clause to our standard contract

4. Assess enforceability in key jurisdictions (US, EU)

5. Summarize findings in <findings> tags with:
   - Issue description
   - Risk level (High/Medium/Low)
   - Deviation from standard

6. List actionable recommendations in <recommendations> tags
</instructions>

<output-format>
<executive-summary>
[3-5 sentence overview for leadership]
</executive-summary>

<findings>
1. [Clause Name] (Clause X):
   - Issue: [Specific concern]
   - Risk: [High/Medium/Low] - [Potential exposure]
   - Deviation: [How it differs from our standard]

[Continue for each significant finding]
</findings>

<recommendations>
1. [Specific action with rationale]
2. [Counter-proposal language if applicable]
3. [Escalation path if needed]
</recommendations>

<negotiation-priority>
Must-have changes: [List]
Should-have changes: [List]
Nice-to-have changes: [List]
</negotiation-priority>
</output-format>
```

## Why This Works

1. **Rich Context**: Company type, industry, risk tolerance
2. **Reference Document**: Standard contract for comparison
3. **Specific Clauses**: Focuses on high-impact areas
4. **Multi-Jurisdiction**: Considers different legal frameworks
5. **Risk Levels**: Helps prioritize concerns
6. **Actionable Output**: Recommendations with negotiation priorities

## Customization Points

- Replace `{{CONTRACT_TEXT}}` with actual agreement
- Replace `{{STANDARD_CONTRACT}}` with your template
- Adjust context for your company and situation
- Modify clause focus areas for contract type
- Add jurisdiction-specific requirements
