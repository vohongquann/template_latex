# report/: the LaTeX report

Everything needed to build the thesis PDF. Build it from this folder:

```bash
cd report
latexmk                 # produces build/main.pdf
```

Install steps (Ubuntu and Windows): [../INSTALL.md](../INSTALL.md). Typing syntax: [../docs/LATEX_CHEATSHEET.md](../docs/LATEX_CHEATSHEET.md). Style rules: [../docs/WRITING_RULES.md](../docs/WRITING_RULES.md).

## Structure

```
report/
├── main.tex                    Order of the document (the only .tex file at this level)
├── info.txt                    Names, title, dates, options. Start here.
├── .latexmkrc                  Build settings: XeLaTeX, output in build/
├── config/
│   ├── info_reader.tex         Reads info.txt into macros (\thesistitle, \authorname, ...). Do not edit.
│   └── 00_preamble.tex         Packages and look: font, margins, spacing, headings, link color
├── frontmatter/                Pages before the chapters
│   ├── 01_titlepage.tex        Cover (printed twice: hard cover, soft cover)
│   ├── 02_acknowledgments.tex
│   ├── 03_commitment.tex       Statement of commitment
│   ├── 04_summary_vi.tex       Vietnamese summary
│   ├── 05_abstract_en.tex      English abstract
│   ├── 06_list_of_figures_tables.tex   Automatic
│   └── 07_abbreviations.tex
├── chapters/                   The content: where you write
│   ├── 08_introduction.tex     Chapter 1
│   ├── 09_background.tex       Chapter 2
│   ├── 10_design_control_vision.tex    Chapter 3
│   ├── 11_simulation_validation.tex    Chapter 4
│   ├── 12_results.tex          Chapter 5
│   └── 13_conclusion.tex       Chapter 6
├── backmatter/
│   ├── 14_references.tex       Bibliography
│   └── 15_appendix.tex         Appendix (off by default)
├── figures/                    Images: border_frame.png, logo.jpg, then yours
├── standalone/
│   └── appendix_standalone.tex Optional: the appendix as its own PDF
└── build/                      Generated (PDF and temp files). Not in git. Safe to delete.
```

File numbers (`00` to `15`) follow the order the files appear in `main.tex`. They only keep the folders sorted; the real order is the `\input` / `\include` lines in `main.tex`. Chapter numbers in the PDF are counted automatically and do not depend on the file numbers.

## How the pieces fit

```
info.txt ──► config/info_reader.tex ──► macros (\thesistitle, \authorname, ...)
                                              │
main.tex ──► config/00_preamble.tex           ├──► frontmatter/01_titlepage.tex      (cover)
   │              (look of the report,        ├──► frontmatter/03_commitment.tex     (commitment page)
   │               PDF title/author, links)◄──┘    config/00_preamble.tex            (PDF properties, link color)
   │
   ├──► frontmatter/*.tex ──► chapters/*.tex ──► backmatter/*.tex
   └──► figures/ (images used by any file above)
```

Order of the pages in the PDF:
1. Cover, blank page, cover (roman page numbers start after these)
2. Assignment sheet (only if the PDF named in `info.txt` exists)
3. Acknowledgments, commitment, Vietnamese summary, English abstract
4. Table of contents, list of figures, list of tables, abbreviations
5. Chapters (arabic page numbers start here)
6. References, then the appendix if `withappendix = true`

## What to edit

| Goal | File |
|---|---|
| Names, title, dates, supervisor, ID | `info.txt` |
| Show the appendix, set the assignment PDF, choose link color (NavyBlue or black) | `info.txt` (bottom) |
| Write the content | `chapters/*.tex` |
| Acknowledgments, abstracts, abbreviations | `frontmatter/*.tex` |
| Sources | `backmatter/14_references.tex` |
| Logo | replace `figures/logo.jpg` (keep the name) |
| Font, margins, spacing, heading style | `config/00_preamble.tex` |
| Add, remove or reorder chapters | `main.tex` |

Each file starts with a comment box saying what to replace and how.

## Common tasks

**Add a chapter.** Create `chapters/14_name.tex`, first line `\chapter{TITLE}`, then add `\include{chapters/14_name}` in `main.tex` among the other chapters, in reading order.

**Remove a chapter or a front-matter page.** Delete its `\include` or `\input` line in `main.tex`. The file can stay or go.

**Add an image.** Put it in `figures/` (lowercase name with underscores), then use `\includegraphics{figures/name.png}` inside a `figure` with `\caption` and `\label`. A missing image shows as a framed box with its file name, so the build never stops for it.

**Add a setting of your own.** Add `mykey = ...` in `info.txt` (letters only) and use `\mykey` in any `.tex` file.

**Change the page look.** Edit `config/00_preamble.tex`; the comment at its top lists what each block controls.

## Build notes

- Always build with `latexmk` from `report/`. It runs XeLaTeX as many times as needed so the table of contents, list of figures and references are right.
- A plain `xelatex main.tex` also works, but run it twice and expect temp files next to `main.tex` instead of in `build/`.
- If something looks wrong after many edits: `latexmk -C` then `latexmk`.
- The build stops on the first error. Open `build/main.log`, search for a line starting with `!`.
