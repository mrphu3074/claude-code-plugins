# 1:1 with Alice - Jan 26

Had a quick 1:1 with Alice today. She's been digging into the API performance issues we noticed last sprint.

Turns out the rate limiting is way too aggressive on the batch endpoints. She pulled some metrics showing we're dropping about 30% of legitimate requests during peak hours. Not great.

We talked about whether to just bump the limits or do a proper redesign. Bob had suggested just adding a caching layer last week, but Alice thinks that's a band-aid. I agree - the whole API surface has accumulated tech debt since v1.

She's going to put together a proposal for a v2 redesign by next Friday. I need to pull the usage analytics from Datadog before then so she has the data to back it up.

Carol wants to see something concrete before the Q2 planning meeting on Feb 15. So we need to move fast on this.

Also talked about Dave's onboarding - Alice has been mentoring him and says he's picking things up quickly. She suggested putting him on the API docs task since it would help him learn the system. Good idea.

One concern: if we go with the full redesign, it might push back the Q2 feature timeline. Need to flag this to Carol early.

Oh and Alice mentioned she's interested in the new GraphQL workshop happening next month. I'll forward her the details.
