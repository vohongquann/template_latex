# Installing LaTeX

The report is built with XeLaTeX through `latexmk`. Run every command inside `report/`.

## Ubuntu

```bash
sudo apt update
sudo apt install latexmk texlive-xetex texlive-latex-recommended texlive-latex-extra \
                 texlive-pictures texlive-science fonts-texgyre
```

Times New Roman is not installed by default, so the template falls back to TeX Gyre Termes (a Times clone). For the real font: `sudo apt install ttf-mscorefonts-installer`.

```bash
cd report
latexmk
xdg-open build/main.pdf
```

## Windows

1. **MiKTeX**: https://miktex.org/download. Set *Install missing packages on-the-fly = Yes*.
2. **Perl** (needed by `latexmk`): **Strawberry Perl** from https://strawberryperl.com, default install.
3. Reopen the terminal and check: `latexmk -v`, `xelatex --version`, `perl -v`.

Alternative: install TeX Live (https://tug.org/texlive), which already includes `latexmk` and Perl.

```powershell
cd report
latexmk
start build\main.pdf
```

## Common commands

| Command | Effect |
|---------|--------|
| `latexmk` | Build `build/main.pdf` |
| `latexmk -pvc` | Rebuild automatically on save |
| `latexmk -c` | Delete auxiliary files, keep the PDF |
| `latexmk -C` | Delete everything including the PDF |

## Troubleshooting

- **`latexmk` not found (Windows)**: Perl is not installed, or the terminal was not reopened.
- **MiKTeX asks to install a package**: click *Install*, then run `latexmk` again.
- **Broken characters**: save files as UTF-8.
- **PDF does not update (Windows)**: close the viewer locking `main.pdf`, or use SumatraPDF.
- **Strange errors after many edits**: run `latexmk -C`, then `latexmk`.
