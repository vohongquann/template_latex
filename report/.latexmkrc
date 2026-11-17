# Build settings. Run `latexmk` in this folder; the PDF is build/main.pdf.

@default_files = ('main.tex');      # otherwise latexmk compiles every .tex file here
$pdf_mode = 5;                      # XeLaTeX (needed by fontspec)
$out_dir  = 'build';
$aux_dir  = 'build';
$xelatex  = 'xelatex -interaction=nonstopmode -halt-on-error -file-line-error %O %S';

# \include writes one .aux per source file, so mirror the source folders in build/.
for my $dir ('build', map { "build/$_" } qw(frontmatter chapters backmatter)) {
    mkdir $dir unless -d $dir;
}
