# LaTeX Thesis Template

A project folder layout for a thesis or research project: source code, documents, a LaTeX report and a submission package. The report builds the same way on Ubuntu and Windows.

## Structure

| Folder | Contents |
|---|---|
| [`report/`](report/) | The LaTeX report (build here) |
| [`tools/`](tools/) | Notebooks, plotting scripts and outputs that feed the report |
| [`docs/`](docs/) | Papers, research notes, theory, references, [`WRITING_RULES.md`](docs/WRITING_RULES.md), [`LATEX_CHEATSHEET.md`](docs/LATEX_CHEATSHEET.md) |
| [`hardware/`](hardware/) | Schematics, datasheets, BOM, build guide |
| [`firmware/`](firmware/) | Microcontroller code |
| [`sim/`](sim/) | Simulation |
| [`software/`](software/) | Desktop software (vision, AI, GUI) |
| [`reference/`](reference/) | Other people's code kept for reference |
| [`submission/`](submission/) | Final submission package and checklist |

Delete any folder your project does not use.

## Build

1. Install LaTeX once, following [INSTALL.md](INSTALL.md).
2. Build:

```bash
cd report
latexmk              # produces build/main.pdf
```

The template ships without images: every missing image shows as a framed box with its file name. Put the real file in `figures/` with that name and it appears on the next build.

## Report layout (`report/`)

File numbers follow the order in `main.tex` (`00` is the preamble, `01`..`15` are the document parts).

```
main.tex              Order of the document (with info.txt and .latexmkrc, the only files at this level)
.latexmkrc            Build settings (XeLaTeX, output goes to build/)
info.txt             Names, title, dates, options: plain "key = value", no LaTeX
config/info_reader.tex  Reads info.txt (no need to touch)
config/00_preamble.tex   Packages and formatting (page size, font, headings, captions)
frontmatter/          titlepage, commitment, acknowledgments, abstract,
                      list_of_figures_tables, abbreviations
chapters/             One file per chapter
figures/              Images (empty in the template)
backmatter/          14_references.tex (bibliography), 15_appendix.tex (off by default, switch in info.txt)
standalone/           appendix_standalone.tex: the appendix alone, built separately
build/                Generated PDF and temp files (git-ignored)
```

## File-by-file guide

Every file starts with a comment box that says what it is, what to replace and how. The short version:

| File | What you do |
|---|---|
| `report/info.txt` | **Start here.** Replace each `...` with your names, title, dates. Comments on each line show an example. |
| `report/main.tex` | Order of the document. Add, remove or reorder chapters here. Rarely edited. |
| `report/frontmatter/01_titlepage.tex` | Cover. Do not edit the text, it comes from `info.txt`. Replace `figures/logo.jpg` with your logo. |
| `report/frontmatter/02_acknowledgments.tex` | Replace each `...` with your text. |
| `report/frontmatter/03_commitment.tex` | Usually nothing (filled from `info.txt`). Edit the declaration sentence if your school has its own. |
| `report/frontmatter/04_summary_vi.tex`, `05_abstract_en.tex` | Replace `...` with the summary / abstract. |
| `report/frontmatter/06_list_of_figures_tables.tex` | Automatic. Do not edit. |
| `report/frontmatter/07_abbreviations.tex` | One row per abbreviation: `ABBR & full form \\`. |
| `report/chapters/08...13_*.tex` | **Where you write.** Replace each `...`, rename sections, copy the example figure/table/equation from "Template Examples". |
| `report/backmatter/14_references.tex` | One `\bibitem{key}` per source; cite with `\cite{key}`. Templates for article, book, website, thesis are in the file. |
| `report/backmatter/15_appendix.tex` | Appendix. Switch on with `withappendix = true` in `info.txt`. |
| `report/figures/` | Put images here. A missing image shows as a framed box with its file name. |
| `report/config/00_preamble.tex` | Look of the whole report: font, margins, spacing, headings. The top comment lists what to change and where. |
| `report/config/info_reader.tex`, `report/.latexmkrc` | Plumbing. Do not edit. |
| `report/standalone/appendix_standalone.tex` | Optional: builds the appendix alone. Delete the folder if unused. |

Typing text, lists, figures, tables, equations and citations: see [`docs/LATEX_CHEATSHEET.md`](docs/LATEX_CHEATSHEET.md). Style rules: [`docs/WRITING_RULES.md`](docs/WRITING_RULES.md).

## How to

| Task | What to do |
|---|---|
| Change names, title, dates (cover, commitment page, PDF properties) | Edit `report/info.txt` (plain `key = value`, then run `latexmk`) |
| Include the appendix, set the assignment PDF, choose the link color (NavyBlue or black) | Options at the bottom of `report/info.txt` |
| Write a chapter | Edit the file in `chapters/` |
| Add a chapter | Create `chapters/NN_name.tex` starting with `\chapter{TITLE}`, then add `\include{chapters/NN_name}` in `main.tex` at the right place |
| Add a figure | Put `name.png` in `figures/`, then use `\includegraphics[width=0.8\textwidth]{figures/name.png}` inside a `figure[H]` with `\caption` and `\label{fig:name}` |
| Add a table | Use a `table[H]` with `\caption` above the table and `\label{tab:name}` |
| Refer to a figure/table/equation | `Figure~\ref{fig:name}`, `Table~\ref{tab:name}`, `\eqref{eq:name}` |
| Cite a reference | Add a `\bibitem{key}` in `backmatter/14_references.tex`, then `\cite{key}` in the text |
| Add an abbreviation | Add a row in `frontmatter/07_abbreviations.tex` |
| Add the assignment sheet | Put the PDF at the path named in the `\IfFileExists{...}` line of `main.tex` (skipped if absent) |
| Build the appendix alone | `cd report/standalone`, then `xelatex appendix_standalone.tex` |
| Change margins, font, spacing | `config/00_preamble.tex` |

Writing and formatting rules: [`docs/WRITING_RULES.md`](docs/WRITING_RULES.md).
