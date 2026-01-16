# Legal & Contract Patterns

XML tag patterns for contract analysis, document review, and legal research tasks.

## Contract Analysis Pattern

```xml
Analyze this software licensing agreement for legal risks and liabilities.

<context>
We're a {{COMPANY_TYPE}} considering this agreement for our {{USE_CASE}}.
</context>

<agreement>
{{CONTRACT_TEXT}}
</agreement>

<standard-contract>
This is our standard contract for reference:
{{STANDARD_CONTRACT}}
</standard-contract>

<instructions>
1. Analyze these clauses:
   - Indemnification
   - Limitation of liability
   - IP ownership
   - Termination conditions
   - Data handling

2. Note unusual or concerning terms

3. Compare to our standard contract

4. Summarize findings in <findings> tags

5. List actionable recommendations in <recommendations> tags
</instructions>
```

### Expected Output Structure

```xml
<findings>
1. Indemnification (Clause X):
   - Issue: [Description]
   - Risk: [Potential exposure]
   - Deviation: [How it differs from standard]

2. Limitation of Liability (Clause Y):
   - Issue: [Description]
   - Risk: [Potential exposure]
   - Deviation: [How it differs from standard]
</findings>

<recommendations>
1. [Action to take]
2. [Counter-proposal points]
3. [Escalation if needed]
</recommendations>
```

## Document Review Pattern

```xml
Review the following legal document for {{PURPOSE}}.

<document type="{{DOC_TYPE}}">
{{DOCUMENT_TEXT}}
</document>

<review-context>
Jurisdiction: {{JURISDICTION}}
Purpose: {{PURPOSE}}
Client type: {{CLIENT_TYPE}}
</review-context>

<review-checklist>
1. Key terms and definitions accuracy
2. Rights and obligations balance
3. Risk allocation fairness
4. Compliance with applicable laws
5. Missing or ambiguous provisions
</review-checklist>

<instructions>
1. Review against all checklist items
2. Flag issues by severity
3. Suggest specific language improvements
4. Note any missing provisions
</instructions>

<output-format>
<summary> - Overall document assessment
<issues>
  <critical> - Must address before signing
  <important> - Should negotiate
  <minor> - Consider addressing
</issues>
<suggested-revisions> - Specific language changes
<missing-provisions> - Provisions to add
</output-format>
```

## Compliance Review Pattern

```xml
Review for compliance with {{REGULATION/STANDARD}}.

<document>
{{DOCUMENT_OR_POLICY}}
</document>

<regulatory-requirements>
{{REQUIREMENTS_SUMMARY}}
</regulatory-requirements>

<current-practices>
{{EXISTING_PRACTICES}}
</current-practices>

<instructions>
1. Map document provisions to requirements
2. Identify gaps in coverage
3. Assess compliance level for each requirement
4. Recommend remediation for gaps
</instructions>

<output-format>
<compliance-matrix>
| Requirement | Document Section | Compliance Level | Gap |
</compliance-matrix>
<gaps-analysis> - Detailed gap descriptions
<remediation-plan> - Steps to achieve compliance
<priority-ranking> - Order of remediation
</output-format>
```

## NDA Review Pattern

```xml
Review this Non-Disclosure Agreement.

<nda>
{{NDA_TEXT}}
</nda>

<context>
Purpose: {{PURPOSE}}
Our role: {{DISCLOSER_OR_RECIPIENT}}
Relationship: {{BUSINESS_RELATIONSHIP}}
Duration needed: {{TERM}}
</context>

<key-concerns>
1. Scope of confidential information
2. Permitted disclosures
3. Term and survival
4. Return/destruction obligations
5. Injunctive relief provisions
</key-concerns>

<instructions>
1. Assess each key concern
2. Compare to market-standard terms
3. Identify unfavorable provisions
4. Suggest revisions
</instructions>

<output-format>
<assessment>
  For each concern:
  - Current provision
  - Market standard
  - Risk level
  - Recommendation
</assessment>
<redline-suggestions> - Specific text changes
<negotiation-points> - Key items to negotiate
</output-format>
```

## Terms of Service Analysis Pattern

```xml
Analyze these Terms of Service for user-friendliness and legal soundness.

<terms-of-service>
{{TOS_TEXT}}
</terms-of-service>

<service-context>
Service type: {{SERVICE_TYPE}}
Target users: {{USER_TYPE}}
Jurisdiction: {{JURISDICTION}}
</service-context>

<analysis-dimensions>
1. Clarity and readability
2. User rights and protections
3. Company protections
4. Data privacy provisions
5. Dispute resolution
6. Termination conditions
</analysis-dimensions>

<instructions>
1. Analyze each dimension
2. Rate on user-friendliness scale
3. Identify concerning provisions
4. Compare to industry standards
5. Suggest improvements
</instructions>

<output-format>
<readability-score> - Plain language assessment
<dimension-analysis>
  For each dimension:
  - Current state
  - Industry comparison
  - Concerns
  - Improvements
</dimension-analysis>
<user-friendly-rewrite> - Simplified key sections
</output-format>
```

## Legal Research Pattern

```xml
Research the legal question: {{QUESTION}}

<context>
Jurisdiction: {{JURISDICTION}}
Area of law: {{PRACTICE_AREA}}
Client situation: {{SITUATION}}
</context>

<known-facts>
{{RELEVANT_FACTS}}
</known-facts>

<specific-questions>
1. {{QUESTION_1}}
2. {{QUESTION_2}}
3. {{QUESTION_3}}
</specific-questions>

<instructions>
1. Identify applicable laws and regulations
2. Find relevant precedents
3. Analyze how law applies to facts
4. Provide conclusion with confidence level
</instructions>

<output-format>
<legal-framework> - Applicable statutes and regulations
<precedents> - Relevant cases and their holdings
<analysis> - Application of law to facts
<conclusion> - Answer with confidence level
<caveats> - Limitations and uncertainties
<recommendations> - Suggested next steps
</output-format>
```

## Contract Drafting Pattern

```xml
Draft a {{CONTRACT_TYPE}} for the following scenario.

<parties>
Party A: {{PARTY_A_INFO}}
Party B: {{PARTY_B_INFO}}
</parties>

<deal-terms>
{{KEY_TERMS}}
</deal-terms>

<requirements>
{{SPECIFIC_REQUIREMENTS}}
</requirements>

<governing-law>
{{JURISDICTION}}
</governing-law>

<instructions>
1. Include standard boilerplate provisions
2. Address all key deal terms
3. Use clear, unambiguous language
4. Balance protections for both parties
5. Include appropriate definitions
</instructions>

<output-format>
<contract>
[Full contract text with sections numbered]
</contract>
<key-provisions-summary> - Important terms highlighted
<customization-notes> - Provisions that may need adjustment
</output-format>
```

## Due Diligence Review Pattern

```xml
Conduct due diligence review of {{TARGET_ENTITY}}.

<documents>
{{DOCUMENT_LIST_OR_TEXT}}
</documents>

<transaction-context>
Transaction type: {{TYPE}}
Deal value: {{VALUE}}
Timeline: {{TIMELINE}}
</transaction-context>

<review-areas>
1. Corporate structure and governance
2. Material contracts
3. Litigation and disputes
4. Regulatory compliance
5. IP and proprietary rights
6. Employment matters
</review-areas>

<instructions>
1. Review documents for each area
2. Flag risks and concerns
3. Identify missing information
4. Prioritize issues by materiality
</instructions>

<output-format>
<executive-summary> - Key findings overview
<area-reports>
  For each area:
  - Documents reviewed
  - Key findings
  - Risks identified
  - Missing information
</area-reports>
<risk-matrix> - Prioritized risk list
<information-requests> - Additional docs needed
</output-format>
```

## Claim Analysis Pattern

```xml
Analyze the following legal claim.

<claim-details>
{{CLAIM_INFORMATION}}
</claim-details>

<supporting-documents>
{{EVIDENCE_AND_DOCUMENTS}}
</supporting-documents>

<applicable-law>
{{JURISDICTION_AND_STATUTES}}
</applicable-law>

<instructions>
1. Identify elements of the claim
2. Assess strength of each element
3. Evaluate available evidence
4. Identify potential defenses
5. Estimate likelihood of success
</instructions>

<output-format>
<claim-elements>
  For each element:
  - Legal standard
  - Evidence supporting
  - Evidence against
  - Strength assessment
</claim-elements>
<defenses> - Potential defensive arguments
<success-probability> - Overall assessment with rationale
<recommendations> - Strategy recommendations
</output-format>
```

## Best Practices for Legal Prompts

### Document Presentation
- Use `<agreement>`, `<contract>`, or `<document>` tags
- Include document type attribute when relevant
- Provide complete text or clearly indicate excerpts

### Context Importance
- Always specify jurisdiction
- Clarify party roles and relationships
- State the purpose of the review

### Output Structure
- Request findings/recommendations separation
- Ask for risk prioritization
- Include specific revision suggestions

### Professional Standards
- Request citation of specific provisions
- Ask for comparison to standards
- Include confidence levels in conclusions
