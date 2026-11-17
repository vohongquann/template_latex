# Writing rules

These apply to this folder. Adjust them to match your institution's guidelines.

## Punctuation
- Every `\paragraph{}` ends with a colon inside the braces: `\paragraph{Title:}`. The text starts on the next line (configured in `report/config/00_preamble.tex`; do not add `\\`).
- A bold label at the start of an `\item` also ends with a colon: `\item \textbf{Vibration noise:} ...`
- Do not use `---` as a separator in sentences, titles or items. Use `:`.
- Write `Not applicable` in table cells without data.

## Bold text
- Do not use `\textbf{}` to emphasize words, numbers, results or remarks.
- Keep only structural bold: titles, table column headers, labels at the start of `\item`, labels in diagrams.

## Figures and tables
- Figures live in `report/figures/`, with lowercase underscore names that describe them (`block_diagram.png`, not `image.png`).
- Figure captions go below the figure, table captions above the table. Both need a `\label{}` (`fig:`, `tab:`).
- Use `[H]` (package `float`) so figures and tables stay where they are written.
- Put two related sub-figures in two `minipage`s with a fixed gap; avoid `\hfill` if it leaves a large empty space.

## References
- List only works that are cited, ordered by first citation.

## Page format (change in `report/config/00_preamble.tex`)
- A4, margins: top 20 mm, bottom 20 mm, left 25 mm, right 15 mm.
- 13pt text, line spacing 1.3, first-line indent 1.5em.
