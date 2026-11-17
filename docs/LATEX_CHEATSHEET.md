# LaTeX cheat sheet for writing the report

You only need these. Everything else is already set up in `report/`.

## Text
| You want | Type |
|---|---|
| New paragraph | leave one blank line |
| Line break inside a paragraph | `\\` at the end of the line |
| **Bold** | `\textbf{text}` (see `docs/WRITING_RULES.md`: use sparingly) |
| *Italic* | `\emph{text}` |
| `Monospace` (file or command name) | `\texttt{name}` |
| Footnote | `text\footnote{The footnote.}` |
| Quotes | ``` ``quoted'' ``` (two backticks, two apostrophes) |
| Non-breaking space (keeps "Figure" and its number together) | `Figure~\ref{fig:name}` |
| En dash for ranges | `10--20` |
| Comment (ignored) | start the line with `%` |

## Characters that need a backslash
Write `\&`  `\%`  `\$`  `\#`  `\_`  `\{`  `\}` to print `& % $ # _ { }`.
(Exception: in `info.txt` you type them as they are.)

## Headings
```latex
\chapter{CHAPTER TITLE}        % one per chapter file
\section{Section title}
\subsection{Subsection title}
\paragraph{Small heading:}     % must end with a colon, text starts on the next line
```

## Lists
```latex
\begin{itemize}                % bullets
  \item First
  \item Second
\end{itemize}

\begin{enumerate}              % numbered
  \item First
  \item Second
\end{enumerate}
```

## Equations
```latex
Inline: $y = ax + b$.

Numbered, can be referred to:
\begin{equation}
  y = ax + b
  \label{eq:line}
\end{equation}
See Equation~\eqref{eq:line}.
```

## Figures
Put the image in `report/figures/` (lowercase name with underscores, e.g. `block_diagram.png`).
```latex
\begin{figure}[H]
  \centering
  \includegraphics[width=0.8\linewidth]{figures/block_diagram.png}
  \caption{What the figure shows.}     % caption goes BELOW the figure
  \label{fig:block-diagram}
\end{figure}
Figure~\ref{fig:block-diagram} shows ...
```
A missing image appears as a framed box with its file name, so you can write first and add images later.

## Tables
```latex
\begin{table}[H]
  \centering
  \caption{What the table shows.}      % caption goes ABOVE the table
  \label{tab:results}
  \begin{tabularx}{\linewidth}{lXr}    % l = left, X = fills the width, r = right, c = centered
    \toprule
    \textbf{Name} & \textbf{Description} & \textbf{Value} \\
    \midrule
    A & first row  & 1.0 \\
    B & second row & 2.5 \\
    \bottomrule
  \end{tabularx}
\end{table}
Table~\ref{tab:results} lists ...
```

## References and citations
1. Add an entry in `report/backmatter/14_references.tex`:
```latex
\bibitem{smith2024}
J. Smith, ``Paper title,'' \emph{Journal}, vol.~3, no.~1, pp.~1--10, 2024.
```
2. Cite it in the text: `as shown in \cite{smith2024}`. Number order follows first citation.

## Cross-references
Label things with `\label{...}` and refer with `\ref{...}`:
`Chapter~\ref{chap:design}`, `Section~\ref{sec:setup}`, `Figure~\ref{fig:...}`, `Table~\ref{tab:...}`, `Equation~\eqref{eq:...}`.
Use the prefixes `chap:`, `sec:`, `fig:`, `tab:`, `eq:` so labels stay unique and readable.

## Source code
```latex
\begin{pythoncode}
print("hello")
\end{pythoncode}
```

## Units and numbers
`\SI{9.81}{\meter\per\second\squared}` prints "9.81 m s⁻²". `\si{\kilo\gram}` prints "kg".

## When the build fails
Open `report/build/main.log` and search for a line starting with `!`. The line number after it (`l.123`) is the line in the file named just above. The most common causes are a missing `}` or `\end{...}`, an unescaped `& % # _`, or a `\label` / `\cite` key that does not exist.
