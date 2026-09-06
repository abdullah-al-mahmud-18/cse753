# Create Latex File from Conversation

Create a latex file from the conversation above. Follow below format:

\textbf{My question, minimally repaired}
Your response, cleaned per the rules below. Do not rephrase.
..
..
\textbf{My question, minimally repaired}
Your response, cleaned per the rules below. Do not rephrase.

## Rules for Repairing My Questions (headings only)
The bold heading is my own question with mechanical repairs only. It must still read
as my question, in my words.

Allowed edits — do these:
1. Fix spelling and typos (e.g. "architechture" -> "architecture").
2. Fix grammar minimally: verb agreement, articles, plurals, prepositions,
   capitalization, punctuation.
3. Delete trailing confirmation tags: "right?", "correct?", "yes?", "no?",
   "isn't it?", "am I right?", "is that so?", and similar.
4. Delete filler openers: "ok so", "hmm", "wait", "btw", "one more thing".
5. If removing a confirmation tag leaves a statement, keep it as a statement and end
   it with a period. Example:
   "So each row of Q corresponds to one word, right?"
   -> "Each row of Q corresponds to one word."
6. If my message is long or multi-part, the heading uses only the core ask, repaired.

Forbidden edits — never do these:
7. Do not reword, reorder, or restructure my phrasing.
8. Do not add technical terms, qualifiers, or context I did not write.
9. Do not convert my question into a noun-phrase topic title. "How do the two MHA
   modules share weights?" must not become "Weight Sharing in Multi-Head Attention".
10. Do not merge two of my messages into one heading, or split one into two.
11. Do not change the scope, generalize, or make the question sound more formal
    than I wrote it.

## Rules for Cleaning Your Responses
Your answers were written for a live conversation. In a study note they are being
read cold, with no back-and-forth. Remove conversational scaffolding by DELETING it.
This is deletion, not rewriting — the surviving sentences must be exactly the
sentences I read in the chat.

Delete these:
12. Praise and reaction openers: "Great question", "Good catch", "Exactly",
    "Interesting", "Nice", "Ah", "Right".
13. Closing offers and check-ins: "Let me know if you want me to go deeper",
    "Does that make sense?", "Want me to walk through an example?", "Hope this helps",
    "Feel free to ask".
14. Forward and backward references to the conversation itself: "as I mentioned
    earlier", "as we discussed above", "I'll cover that in the next answer",
    "going back to your earlier question", "you already know this".
15. Self-correction narration and apologies: "You're right, I missed that",
    "Sorry, let me correct myself", "I should have said". Keep the corrected
    technical content; delete only the apology and the narration around it.
16. Narration of my own process: "Let me look at the file", "Let me render the
    slides", "First I'll check the paper", and any description of tool use.
17. Meta-commentary about the answer itself: "This is a long one", "Short answer:"
    used only as a lead-in, "Here's the thing", "To be clear".

Keep these:
18. When my question was a yes/no or a confirmation check, keep a bare "Yes." or
    "No." as the first line — it carries the answer. Delete only the praise attached
    to it. "Yes — exactly right, great question." becomes "Yes."
19. Genuine epistemic hedges that reflect real uncertainty in the material ("this is
    debated", "the paper does not specify"). These are content, not filler.
20. Second-person phrasing that is doing explanatory work ("notice that each row
    corresponds to one token"). Only delete second-person text when it is addressing
    me socially rather than explaining something.
21. All math, tables, numerical examples, dimensions, and enumerations — in full.
    Never shorten or summarize technical content while cleaning.

Constraints on the cleaning:
22. Do not add sentences, transitions, or connective tissue that I did not read in
    the chat.
23. If deleting a clause leaves a broken sentence, repair it with the smallest
    possible edit — fixing the connective or the capitalization, nothing more.
24. If a whole response consisted only of conversational material with no technical
    content, drop that question-and-answer block entirely.

## Rules to Follow while Writing Latex
25. Do not write latex setup code.
26. Keep the latex formatting simple and minimal.
27. No colors or fancy design.
28. Do not put any horizontal lines in latex.
29. No boxes.
30. Tables are allowed. If any cell has large content that may exceed margin,
    break the contents into multiple lines.
31. Do not use any custom latex command. Do not create any custom command. Use
    built in libraries.

## What to Exclude
32. Skip this export request itself and any purely administrative messages
    ("thanks", "continue", "go on") that have no technical content.
33. If one of my messages was a correction to your answer, keep it as its own
    heading — do not fold it into the previous answer.
34. If a later message corrected an earlier answer, append one plain sentence to the earlier answer noting it was corrected below.


# Create Note from Lecture

# Task
Create latex file study notes from the lecture file(s) I specify, using the other project
files as supporting references.

Lecture file(s): <FILE NAME(S)>
Scope: <PAGE RANGE / TOPICS, or "entire deck">
Reference files: All remaining project files

# Step 1 — Read before writing
Rasterize the lecture pages and inspect them visually, not just text
extraction. Slides carry diagrams, arrows, and layout meaning that plain text loses.
Do the same for any figure I point you to in the reference papers.
Do not begin writing until you have gone through every page in scope.

# Step 2 — Depth and content rules
- Explain in plain English. Assume you are explaining to an 8th grade student.
- Explain equations in plain English like you are explaining to an 8th grade student. 
  Explain what each symbol in the equation stands for. Then explaining what 
  the equation is saying. 
- Explain mechanism, not vocabulary. For every component, state what it does, what
  shape the tensors are, and why it is there. A definition alone is not an answer.
- Where a slide is terse or asserts something without justification, expand it using
  the reference papers. Say which paper and which section the expansion comes from.
- Include a concrete numerical walkthrough for any operation involving matrices,
  probabilities, or normalization. Use small toy dimensions (d_model = 4, vocab of
  5 tokens, sequence of 3 words). Show the intermediate values, not just the formula.
- State parameter counts and matrix dimensions explicitly wherever weights are
  introduced.
- Where two concepts are easily confused, add a short explicit contrast (e.g. W_O vs
  the output projection, masked self-attention vs cross-attention). Name the confusion
  and resolve it.
- Verify every formula before writing it. Check dimensions on both sides. If a slide
  contains an error or an ambiguity, flag it rather than reproducing it silently.
- If something in the lecture is genuinely underspecified and the references do not
  settle it, say so in one line. Do not paper over the gap.
- No code unless I explicitly ask for it.
- No padding: no motivational preambles, no "in this section we will", no summaries
  that restate what was just said.

# Step 3 — Structure
Organize by lecture page or by topic, in the order the lecture presents them.
For each unit:
  - Heading naming the page/topic
  - The core idea in 2-4 sentences
  - The mechanism, with math
  - Numerical example where applicable
  - Any correction, caveat, or reference-paper expansion

End with a short list of the key formulas from the whole set, and nothing else.

# Step 4 — Formatting
Produce a LaTeX file.
- Minimal style. No colors, no boxes, no shaded backgrounds, no horizontal rules.
- No custom commands or macros. Built-in packages only (amsmath, amssymb, booktabs
  if needed for tables).
- Preamble kept to the minimum needed to compile.
- Display math for anything longer than a single symbol; inline math otherwise.
- Tables allowed. If a cell's content is wide, break it across multiple lines so it
  stays inside the margins.
- Sensible margins and a readable body size; nothing decorative.

Give me the latex file when it's done.


# Explain a Page

Explain page 11 of `CSE_753_07_Actor_Critic_Methods.pdf` simply in plain English. Assume that you are explaining to an 8th grade student. For reference use project files. When explaining equation explain like following:
Explain what each symbol in the equation stands for.
1 - 10 sentences explaining what the equation is saying.
