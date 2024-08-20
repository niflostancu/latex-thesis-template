# XeLaTex-based PhD thesis template

This was my personal PhD template, derived from [Mircea Bardac's
template](https://github.com/cs-pub-ro/templates/tree/master/theses/phd),
bringing several changes:

- compatible with either [LatexMk](https://ctan.org/pkg/latexmk) or 
  [Tectonic](https://tectonic-typesetting.github.io/) build system;
- uses XeLaTex, bringing unicode and multilingual support, better fonts etc.;
- better files structure & organization;
- additional summary / translated summary templates (optional);
- many fixes (which I forgot about);

## Prerequisites

Simply install [Tectonic](https://tectonic-typesetting.github.io/) (**recommended**, 
since it will automatically download all required packages) or a full / 
stripped-down Texlive distribution (be careful though, there are many dependencies
which I won't list here, but e.g.: xelatex, latexmk, bibtex extras, STIX fonts, babel
languages etc.).

## Building

Either use the bundled Makefile ([check its code before](./Makefile)!) or simply
invoke your build tool, e.g.:

```sh
tectonic thesis.tex
```
