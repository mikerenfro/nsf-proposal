# nsf-proposal: Basic LaTeX2e documentclass for NSF proposals

Mike Renfro (GitHub/Twitter: @mikerenfro)

![Sample Project Summary page](sample-output/summary-palatino-12.png)

![Sample Project Description page](sample-output/description-palatino-12.png)

![Sample Project References page](sample-output/references-palatino-12.png)

This needs better documentation, but for now, this documentclass lets you make
relatively compact NSF proposals with a minimum of fiddly ad hoc formatting
inside the main document.
We've used this documentclass for both an MRI and a CC* proposal in 2021, and
it's just been recently been verified for the 2024 PAPPG standards (as far as
I know).

## TL;DR

`\documentclass[fontsize,basefont]` where `fontsize` is `10pt`, `11pt`, or
`12pt`, and `basefont` is any of:

 - `arial`
 - `cm` (the default)
 - `courier-new`
 - `helvetica`
 - `palatino`
 - `palatino-linotype` (may only work by default on Windows)
 - `times-new-roman`

Optionally, add the `tg` class option to use the TeX Gyre equivalents to Courier
New, Helvetica, Palatino, or Times New Roman (seems to require LuaLaTeX rather
than XeLaTeX for full functionality).

Now write the rest of your proposal, using `\chapter` on down to `\paragraph`
to break things up. You'll want to use the starred versions of these on the
one-page project summary. See `nsf-demo.tex` for an example.

## More Details

This documentclass uses the [memoir](https://ctan.org/pkg/memoir) class as its base, and supports proposals
with a base font size of 10 points and higher (for the `arial`, `courier-new`,
`helvetica`, `palatino`, and `palatino-linotype` options), or 11 points and higher (for the `cm`
and `times-new-roman` options).
It adds a small amount of whitespace around lines at 10pt, since NSF's PDF
readers will often flag a 10pt document as having more than 6 lines per inch.
We also noticed that LuaLaTeX creates a slightly different line height than
pdfLaTeX, so if you're using Overleaf, you may want to set the default engine
to pdfLaTeX, or if you find a better solution that works with both engines,
send me a pull request.

It disables most, if not all, of the hyperlinks in the main body of the
proposal, leaving hyperlinks active in the references.

The documentclass code is around 250 lines, including whitespace and
comments, so it should be relatively readable (over half of that is
handling different base fonts).
The documentclass depends on the following packages:

- fontspec (if using LuaLaTeX or XeLaTeX)
- helvet (for option `helvetica`)
- hyperref
- iftex
- mathpazo (for option `palatino` and `palatino-linotype`)
- sansmath (for option `arial` and `helvetica`)
- xstring

Sample source files for a proposal can be found in:

- nsf-demo.tex
- nsf-demo.bib

The split PDF output from the sample document can be found in all valid
combinations of font faces, sizes, and LaTeX engines in the `sample-output/`
folder:

## Sample Output

### arial

|          | 10&nbsp;pt | 11&nbsp;pt | 12&nbsp;pt |
| -------- | ----- | ----- | ----- |
| pdf |  N/A |  N/A |  N/A | 
| pdfxe | [summary](sample-output/arial/arial-pdfxe-10pt-summary.pdf), [description](sample-output/arial/arial-pdfxe-10pt-description.pdf), [references](sample-output/arial/arial-pdfxe-10pt-references.pdf), [combined](sample-output/arial/arial-pdfxe-10pt.pdf) | [summary](sample-output/arial/arial-pdfxe-11pt-summary.pdf), [description](sample-output/arial/arial-pdfxe-11pt-description.pdf), [references](sample-output/arial/arial-pdfxe-11pt-references.pdf), [combined](sample-output/arial/arial-pdfxe-11pt.pdf) | [summary](sample-output/arial/arial-pdfxe-12pt-summary.pdf), [description](sample-output/arial/arial-pdfxe-12pt-description.pdf), [references](sample-output/arial/arial-pdfxe-12pt-references.pdf), [combined](sample-output/arial/arial-pdfxe-12pt.pdf) | 
| pdflua | [summary](sample-output/arial/arial-pdflua-10pt-summary.pdf), [description](sample-output/arial/arial-pdflua-10pt-description.pdf), [references](sample-output/arial/arial-pdflua-10pt-references.pdf), [combined](sample-output/arial/arial-pdflua-10pt.pdf) | [summary](sample-output/arial/arial-pdflua-11pt-summary.pdf), [description](sample-output/arial/arial-pdflua-11pt-description.pdf), [references](sample-output/arial/arial-pdflua-11pt-references.pdf), [combined](sample-output/arial/arial-pdflua-11pt.pdf) | [summary](sample-output/arial/arial-pdflua-12pt-summary.pdf), [description](sample-output/arial/arial-pdflua-12pt-description.pdf), [references](sample-output/arial/arial-pdflua-12pt-references.pdf), [combined](sample-output/arial/arial-pdflua-12pt.pdf) | 

### cm

|          | 10&nbsp;pt | 11&nbsp;pt | 12&nbsp;pt |
| -------- | ----- | ----- | ----- |
| pdf |  N/A | [summary](sample-output/cm/cm-pdf-11pt-summary.pdf), [description](sample-output/cm/cm-pdf-11pt-description.pdf), [references](sample-output/cm/cm-pdf-11pt-references.pdf), [combined](sample-output/cm/cm-pdf-11pt.pdf) | [summary](sample-output/cm/cm-pdf-12pt-summary.pdf), [description](sample-output/cm/cm-pdf-12pt-description.pdf), [references](sample-output/cm/cm-pdf-12pt-references.pdf), [combined](sample-output/cm/cm-pdf-12pt.pdf) | 
| pdfxe |  N/A | [summary](sample-output/cm/cm-pdfxe-11pt-summary.pdf), [description](sample-output/cm/cm-pdfxe-11pt-description.pdf), [references](sample-output/cm/cm-pdfxe-11pt-references.pdf), [combined](sample-output/cm/cm-pdfxe-11pt.pdf) | [summary](sample-output/cm/cm-pdfxe-12pt-summary.pdf), [description](sample-output/cm/cm-pdfxe-12pt-description.pdf), [references](sample-output/cm/cm-pdfxe-12pt-references.pdf), [combined](sample-output/cm/cm-pdfxe-12pt.pdf) | 
| pdflua |  N/A | [summary](sample-output/cm/cm-pdflua-11pt-summary.pdf), [description](sample-output/cm/cm-pdflua-11pt-description.pdf), [references](sample-output/cm/cm-pdflua-11pt-references.pdf), [combined](sample-output/cm/cm-pdflua-11pt.pdf) | [summary](sample-output/cm/cm-pdflua-12pt-summary.pdf), [description](sample-output/cm/cm-pdflua-12pt-description.pdf), [references](sample-output/cm/cm-pdflua-12pt-references.pdf), [combined](sample-output/cm/cm-pdflua-12pt.pdf) | 

### courier-new

|          | 10&nbsp;pt | 11&nbsp;pt | 12&nbsp;pt |
| -------- | ----- | ----- | ----- |
| pdf |  N/A |  N/A |  N/A | 
| pdfxe | [summary](sample-output/courier-new/courier-new-pdfxe-10pt-summary.pdf), [description](sample-output/courier-new/courier-new-pdfxe-10pt-description.pdf), [references](sample-output/courier-new/courier-new-pdfxe-10pt-references.pdf), [combined](sample-output/courier-new/courier-new-pdfxe-10pt.pdf) | [summary](sample-output/courier-new/courier-new-pdfxe-11pt-summary.pdf), [description](sample-output/courier-new/courier-new-pdfxe-11pt-description.pdf), [references](sample-output/courier-new/courier-new-pdfxe-11pt-references.pdf), [combined](sample-output/courier-new/courier-new-pdfxe-11pt.pdf) | [summary](sample-output/courier-new/courier-new-pdfxe-12pt-summary.pdf), [description](sample-output/courier-new/courier-new-pdfxe-12pt-description.pdf), [references](sample-output/courier-new/courier-new-pdfxe-12pt-references.pdf), [combined](sample-output/courier-new/courier-new-pdfxe-12pt.pdf) | 
| pdflua | [summary](sample-output/courier-new/courier-new-pdflua-10pt-summary.pdf), [description](sample-output/courier-new/courier-new-pdflua-10pt-description.pdf), [references](sample-output/courier-new/courier-new-pdflua-10pt-references.pdf), [combined](sample-output/courier-new/courier-new-pdflua-10pt.pdf) | [summary](sample-output/courier-new/courier-new-pdflua-11pt-summary.pdf), [description](sample-output/courier-new/courier-new-pdflua-11pt-description.pdf), [references](sample-output/courier-new/courier-new-pdflua-11pt-references.pdf), [combined](sample-output/courier-new/courier-new-pdflua-11pt.pdf) | [summary](sample-output/courier-new/courier-new-pdflua-12pt-summary.pdf), [description](sample-output/courier-new/courier-new-pdflua-12pt-description.pdf), [references](sample-output/courier-new/courier-new-pdflua-12pt-references.pdf), [combined](sample-output/courier-new/courier-new-pdflua-12pt.pdf) | 

### courier-new (TeX Gyre Cursor)

|          | 10&nbsp;pt | 11&nbsp;pt | 12&nbsp;pt |
| -------- | ----- | ----- | ----- |
| pdf |  N/A |  N/A |  N/A | 
| pdfxe |  N/A |  N/A |  N/A | 
| pdflua | [summary](sample-output/courier-new/courier-new-pdflua,tg-10pt-summary.pdf), [description](sample-output/courier-new/courier-new-pdflua,tg-10pt-description.pdf), [references](sample-output/courier-new/courier-new-pdflua,tg-10pt-references.pdf), [combined](sample-output/courier-new/courier-new-pdflua,tg-10pt.pdf) | [summary](sample-output/courier-new/courier-new-pdflua,tg-11pt-summary.pdf), [description](sample-output/courier-new/courier-new-pdflua,tg-11pt-description.pdf), [references](sample-output/courier-new/courier-new-pdflua,tg-11pt-references.pdf), [combined](sample-output/courier-new/courier-new-pdflua,tg-11pt.pdf) | [summary](sample-output/courier-new/courier-new-pdflua,tg-12pt-summary.pdf), [description](sample-output/courier-new/courier-new-pdflua,tg-12pt-description.pdf), [references](sample-output/courier-new/courier-new-pdflua,tg-12pt-references.pdf), [combined](sample-output/courier-new/courier-new-pdflua,tg-12pt.pdf) | 

### helvetica

|          | 10&nbsp;pt | 11&nbsp;pt | 12&nbsp;pt |
| -------- | ----- | ----- | ----- |
| pdf | [summary](sample-output/helvetica/helvetica-pdf-10pt-summary.pdf), [description](sample-output/helvetica/helvetica-pdf-10pt-description.pdf), [references](sample-output/helvetica/helvetica-pdf-10pt-references.pdf), [combined](sample-output/helvetica/helvetica-pdf-10pt.pdf) | [summary](sample-output/helvetica/helvetica-pdf-11pt-summary.pdf), [description](sample-output/helvetica/helvetica-pdf-11pt-description.pdf), [references](sample-output/helvetica/helvetica-pdf-11pt-references.pdf), [combined](sample-output/helvetica/helvetica-pdf-11pt.pdf) | [summary](sample-output/helvetica/helvetica-pdf-12pt-summary.pdf), [description](sample-output/helvetica/helvetica-pdf-12pt-description.pdf), [references](sample-output/helvetica/helvetica-pdf-12pt-references.pdf), [combined](sample-output/helvetica/helvetica-pdf-12pt.pdf) | 
| pdfxe | [summary](sample-output/helvetica/helvetica-pdfxe-10pt-summary.pdf), [description](sample-output/helvetica/helvetica-pdfxe-10pt-description.pdf), [references](sample-output/helvetica/helvetica-pdfxe-10pt-references.pdf), [combined](sample-output/helvetica/helvetica-pdfxe-10pt.pdf) | [summary](sample-output/helvetica/helvetica-pdfxe-11pt-summary.pdf), [description](sample-output/helvetica/helvetica-pdfxe-11pt-description.pdf), [references](sample-output/helvetica/helvetica-pdfxe-11pt-references.pdf), [combined](sample-output/helvetica/helvetica-pdfxe-11pt.pdf) | [summary](sample-output/helvetica/helvetica-pdfxe-12pt-summary.pdf), [description](sample-output/helvetica/helvetica-pdfxe-12pt-description.pdf), [references](sample-output/helvetica/helvetica-pdfxe-12pt-references.pdf), [combined](sample-output/helvetica/helvetica-pdfxe-12pt.pdf) | 
| pdflua | [summary](sample-output/helvetica/helvetica-pdflua-10pt-summary.pdf), [description](sample-output/helvetica/helvetica-pdflua-10pt-description.pdf), [references](sample-output/helvetica/helvetica-pdflua-10pt-references.pdf), [combined](sample-output/helvetica/helvetica-pdflua-10pt.pdf) | [summary](sample-output/helvetica/helvetica-pdflua-11pt-summary.pdf), [description](sample-output/helvetica/helvetica-pdflua-11pt-description.pdf), [references](sample-output/helvetica/helvetica-pdflua-11pt-references.pdf), [combined](sample-output/helvetica/helvetica-pdflua-11pt.pdf) | [summary](sample-output/helvetica/helvetica-pdflua-12pt-summary.pdf), [description](sample-output/helvetica/helvetica-pdflua-12pt-description.pdf), [references](sample-output/helvetica/helvetica-pdflua-12pt-references.pdf), [combined](sample-output/helvetica/helvetica-pdflua-12pt.pdf) | 

### helvetica (TeX Gyre Heros)

|          | 10&nbsp;pt | 11&nbsp;pt | 12&nbsp;pt |
| -------- | ----- | ----- | ----- |
| pdf |  N/A |  N/A |  N/A | 
| pdfxe |  N/A |  N/A |  N/A | 
| pdflua | [summary](sample-output/helvetica/helvetica-pdflua,tg-10pt-summary.pdf), [description](sample-output/helvetica/helvetica-pdflua,tg-10pt-description.pdf), [references](sample-output/helvetica/helvetica-pdflua,tg-10pt-references.pdf), [combined](sample-output/helvetica/helvetica-pdflua,tg-10pt.pdf) | [summary](sample-output/helvetica/helvetica-pdflua,tg-11pt-summary.pdf), [description](sample-output/helvetica/helvetica-pdflua,tg-11pt-description.pdf), [references](sample-output/helvetica/helvetica-pdflua,tg-11pt-references.pdf), [combined](sample-output/helvetica/helvetica-pdflua,tg-11pt.pdf) | [summary](sample-output/helvetica/helvetica-pdflua,tg-12pt-summary.pdf), [description](sample-output/helvetica/helvetica-pdflua,tg-12pt-description.pdf), [references](sample-output/helvetica/helvetica-pdflua,tg-12pt-references.pdf), [combined](sample-output/helvetica/helvetica-pdflua,tg-12pt.pdf) | 

### palatino

|          | 10&nbsp;pt | 11&nbsp;pt | 12&nbsp;pt |
| -------- | ----- | ----- | ----- |
| pdf | [summary](sample-output/palatino/palatino-pdf-10pt-summary.pdf), [description](sample-output/palatino/palatino-pdf-10pt-description.pdf), [references](sample-output/palatino/palatino-pdf-10pt-references.pdf), [combined](sample-output/palatino/palatino-pdf-10pt.pdf) | [summary](sample-output/palatino/palatino-pdf-11pt-summary.pdf), [description](sample-output/palatino/palatino-pdf-11pt-description.pdf), [references](sample-output/palatino/palatino-pdf-11pt-references.pdf), [combined](sample-output/palatino/palatino-pdf-11pt.pdf) | [summary](sample-output/palatino/palatino-pdf-12pt-summary.pdf), [description](sample-output/palatino/palatino-pdf-12pt-description.pdf), [references](sample-output/palatino/palatino-pdf-12pt-references.pdf), [combined](sample-output/palatino/palatino-pdf-12pt.pdf) | 
| pdfxe | [summary](sample-output/palatino/palatino-pdfxe-10pt-summary.pdf), [description](sample-output/palatino/palatino-pdfxe-10pt-description.pdf), [references](sample-output/palatino/palatino-pdfxe-10pt-references.pdf), [combined](sample-output/palatino/palatino-pdfxe-10pt.pdf) | [summary](sample-output/palatino/palatino-pdfxe-11pt-summary.pdf), [description](sample-output/palatino/palatino-pdfxe-11pt-description.pdf), [references](sample-output/palatino/palatino-pdfxe-11pt-references.pdf), [combined](sample-output/palatino/palatino-pdfxe-11pt.pdf) | [summary](sample-output/palatino/palatino-pdfxe-12pt-summary.pdf), [description](sample-output/palatino/palatino-pdfxe-12pt-description.pdf), [references](sample-output/palatino/palatino-pdfxe-12pt-references.pdf), [combined](sample-output/palatino/palatino-pdfxe-12pt.pdf) | 
| pdflua | [summary](sample-output/palatino/palatino-pdflua-10pt-summary.pdf), [description](sample-output/palatino/palatino-pdflua-10pt-description.pdf), [references](sample-output/palatino/palatino-pdflua-10pt-references.pdf), [combined](sample-output/palatino/palatino-pdflua-10pt.pdf) | [summary](sample-output/palatino/palatino-pdflua-11pt-summary.pdf), [description](sample-output/palatino/palatino-pdflua-11pt-description.pdf), [references](sample-output/palatino/palatino-pdflua-11pt-references.pdf), [combined](sample-output/palatino/palatino-pdflua-11pt.pdf) | [summary](sample-output/palatino/palatino-pdflua-12pt-summary.pdf), [description](sample-output/palatino/palatino-pdflua-12pt-description.pdf), [references](sample-output/palatino/palatino-pdflua-12pt-references.pdf), [combined](sample-output/palatino/palatino-pdflua-12pt.pdf) | 

### palatino (TeX Gyre Pagella)

|          | 10&nbsp;pt | 11&nbsp;pt | 12&nbsp;pt |
| -------- | ----- | ----- | ----- |
| pdf |  N/A |  N/A |  N/A | 
| pdfxe |  N/A |  N/A |  N/A | 
| pdflua | [summary](sample-output/palatino/palatino-pdflua,tg-10pt-summary.pdf), [description](sample-output/palatino/palatino-pdflua,tg-10pt-description.pdf), [references](sample-output/palatino/palatino-pdflua,tg-10pt-references.pdf), [combined](sample-output/palatino/palatino-pdflua,tg-10pt.pdf) | [summary](sample-output/palatino/palatino-pdflua,tg-11pt-summary.pdf), [description](sample-output/palatino/palatino-pdflua,tg-11pt-description.pdf), [references](sample-output/palatino/palatino-pdflua,tg-11pt-references.pdf), [combined](sample-output/palatino/palatino-pdflua,tg-11pt.pdf) | [summary](sample-output/palatino/palatino-pdflua,tg-12pt-summary.pdf), [description](sample-output/palatino/palatino-pdflua,tg-12pt-description.pdf), [references](sample-output/palatino/palatino-pdflua,tg-12pt-references.pdf), [combined](sample-output/palatino/palatino-pdflua,tg-12pt.pdf) | 

### palatino-linotype

|          | 10&nbsp;pt | 11&nbsp;pt | 12&nbsp;pt |
| -------- | ----- | ----- | ----- |
| pdf |  N/A |  N/A |  N/A | 
| pdfxe | [summary](sample-output/palatino-linotype/palatino-linotype-pdfxe-10pt-summary.pdf), [description](sample-output/palatino-linotype/palatino-linotype-pdfxe-10pt-description.pdf), [references](sample-output/palatino-linotype/palatino-linotype-pdfxe-10pt-references.pdf), [combined](sample-output/palatino-linotype/palatino-linotype-pdfxe-10pt.pdf) | [summary](sample-output/palatino-linotype/palatino-linotype-pdfxe-11pt-summary.pdf), [description](sample-output/palatino-linotype/palatino-linotype-pdfxe-11pt-description.pdf), [references](sample-output/palatino-linotype/palatino-linotype-pdfxe-11pt-references.pdf), [combined](sample-output/palatino-linotype/palatino-linotype-pdfxe-11pt.pdf) | [summary](sample-output/palatino-linotype/palatino-linotype-pdfxe-12pt-summary.pdf), [description](sample-output/palatino-linotype/palatino-linotype-pdfxe-12pt-description.pdf), [references](sample-output/palatino-linotype/palatino-linotype-pdfxe-12pt-references.pdf), [combined](sample-output/palatino-linotype/palatino-linotype-pdfxe-12pt.pdf) | 
| pdflua | [summary](sample-output/palatino-linotype/palatino-linotype-pdflua-10pt-summary.pdf), [description](sample-output/palatino-linotype/palatino-linotype-pdflua-10pt-description.pdf), [references](sample-output/palatino-linotype/palatino-linotype-pdflua-10pt-references.pdf), [combined](sample-output/palatino-linotype/palatino-linotype-pdflua-10pt.pdf) | [summary](sample-output/palatino-linotype/palatino-linotype-pdflua-11pt-summary.pdf), [description](sample-output/palatino-linotype/palatino-linotype-pdflua-11pt-description.pdf), [references](sample-output/palatino-linotype/palatino-linotype-pdflua-11pt-references.pdf), [combined](sample-output/palatino-linotype/palatino-linotype-pdflua-11pt.pdf) | [summary](sample-output/palatino-linotype/palatino-linotype-pdflua-12pt-summary.pdf), [description](sample-output/palatino-linotype/palatino-linotype-pdflua-12pt-description.pdf), [references](sample-output/palatino-linotype/palatino-linotype-pdflua-12pt-references.pdf), [combined](sample-output/palatino-linotype/palatino-linotype-pdflua-12pt.pdf) | 

### times-new-roman

|          | 10&nbsp;pt | 11&nbsp;pt | 12&nbsp;pt |
| -------- | ----- | ----- | ----- |
| pdf |  N/A |  N/A |  N/A | 
| pdfxe |  N/A | [summary](sample-output/times-new-roman/times-new-roman-pdfxe-11pt-summary.pdf), [description](sample-output/times-new-roman/times-new-roman-pdfxe-11pt-description.pdf), [references](sample-output/times-new-roman/times-new-roman-pdfxe-11pt-references.pdf), [combined](sample-output/times-new-roman/times-new-roman-pdfxe-11pt.pdf) | [summary](sample-output/times-new-roman/times-new-roman-pdfxe-12pt-summary.pdf), [description](sample-output/times-new-roman/times-new-roman-pdfxe-12pt-description.pdf), [references](sample-output/times-new-roman/times-new-roman-pdfxe-12pt-references.pdf), [combined](sample-output/times-new-roman/times-new-roman-pdfxe-12pt.pdf) | 
| pdflua |  N/A | [summary](sample-output/times-new-roman/times-new-roman-pdflua-11pt-summary.pdf), [description](sample-output/times-new-roman/times-new-roman-pdflua-11pt-description.pdf), [references](sample-output/times-new-roman/times-new-roman-pdflua-11pt-references.pdf), [combined](sample-output/times-new-roman/times-new-roman-pdflua-11pt.pdf) | [summary](sample-output/times-new-roman/times-new-roman-pdflua-12pt-summary.pdf), [description](sample-output/times-new-roman/times-new-roman-pdflua-12pt-description.pdf), [references](sample-output/times-new-roman/times-new-roman-pdflua-12pt-references.pdf), [combined](sample-output/times-new-roman/times-new-roman-pdflua-12pt.pdf) | 

### times-new-roman (TeX Gyre Termes)

|          | 10&nbsp;pt | 11&nbsp;pt | 12&nbsp;pt |
| -------- | ----- | ----- | ----- |
| pdf |  N/A |  N/A |  N/A | 
| pdfxe |  N/A |  N/A |  N/A | 
| pdflua |  N/A | [summary](sample-output/times-new-roman/times-new-roman-pdflua,tg-11pt-summary.pdf), [description](sample-output/times-new-roman/times-new-roman-pdflua,tg-11pt-description.pdf), [references](sample-output/times-new-roman/times-new-roman-pdflua,tg-11pt-references.pdf), [combined](sample-output/times-new-roman/times-new-roman-pdflua,tg-11pt.pdf) | [summary](sample-output/times-new-roman/times-new-roman-pdflua,tg-12pt-summary.pdf), [description](sample-output/times-new-roman/times-new-roman-pdflua,tg-12pt-description.pdf), [references](sample-output/times-new-roman/times-new-roman-pdflua,tg-12pt-references.pdf), [combined](sample-output/times-new-roman/times-new-roman-pdflua,tg-12pt.pdf) | 

These PDFs can be uploaded to [research.gov](https://research.gov/) on a test
project, and they shouldn't throw any warnings as provided.

The sample document `nsf-demo.tex` adds the following packages not
specifically required by NSF, but really handy for these sorts of proposals:

- [array](https://ctan.org/pkg/array) (including a ragged right paragraph column type `P`)
- [biblatex](https://ctan.org/pkg/biblatex)
- [booktabs](https://ctan.org/pkg/booktabs) (with a reduced value for `\tabcolsep`)
- [calc](https://ctan.org/pkg/calc)
- [cleveref](https://ctan.org/pkg/cleveref)
- [enumitem](https://ctan.org/pkg/enumitem) (including inline lists)
- [graphicx](https://ctan.org/pkg/graphicx)
- [metalogo](https://ctan.org/pkg/metalogo)
- [multicol](https://ctan.org/pkg/multicol)
- [pifont](https://ctan.org/pkg/pifont)
- [siunitx](https://ctan.org/pkg/siunitx) (including binary units)
- [xcolor](https://ctan.org/pkg/xcolor)
- [xurl](https://ctan.org/pkg/xurl)

As shown in the sample document, you can use a `\chapter*` and `\section*`
for the 1-page Project Summary, `\chapter`, `\section`, `\subsection`,
`\subsubsection`, and `\paragraph` commands as needed in the Project
Description, where the subsubsection and paragraph levels are unnumbered
by default.

Larger font sizes may trigger hyphenation problems for some words and drive
some lines into the right margin, so be sure to add hyphenation as necessary
(already done for the `hurt2021` reference in nsf-demo.bib).

We also made a basic Gantt chart for one of the proposals. It uses
[`pgfgantt`](https://ctan.org/pkg/pgfgantt), with just a bit of abuse to let
us have additional columns for which team member bears primary responsibility
or secondary responsibility. You'll find its source and output in the
`images/` folder.

![Sample Gantt chart](sample-output/nsf-demo-sample-gantt.png)
