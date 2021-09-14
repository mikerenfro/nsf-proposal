\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nsf-proposal}[2021/03/05 memoir class for NSF proposals]
\DeclareOption{9pt}{
  \ClassError{nsf-proposal}{base font too small (<10pt)}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions
\LoadClass[openany]{memoir}

% Page setup
\setstocksize{11in}{8.5in}
\setlrmarginsandblock{1.0in}{1.0in}{*}
\setulmarginsandblock{1.0in}{1.05in}{*}
\raggedbottom

\checkandfixthelayout

% Clear out page headers/footers
\AtBeginDocument{%
  \aliaspagestyle{chapter}{empty}%
  \makeoddhead{headings}{}{}{}%
  \makeevenhead{headings}{}{}{}%
}

% NSF's PDF parsers are too picky about the definition of ``no more than 6
% lines per inch'', so we add a bit of spacing when we're right at that
% limit for 10pt documents.
\AtBeginDocument{%
  \makeatletter%
  \ifdimcomp{\dimexpr\f@size pt}{>}{10pt}{% do nothing if >10pt
    }{% set lengths if <=10pt
    \setlength{\baselineskip}{12.05pt}%
    \@ifpackageloaded{biblatex}{%
      % Not sure why biblatex doesn't want to inherit the default spacing
      \appto{\bibsetup}{\setSpacing{1.004}}%
     }{}%
  }%
  \makeatother%
}

% Document division formatting: headstyle settings apply to that level and
% below, unless overridden

\chapterstyle{article} % no page breaks between chapters

% Unnumbered chapters, larger bold font, centered, whitespace before/after
\renewcommand{\chaptitlefont}{\normalfont\large\bfseries\centering}
\setlength{\beforechapskip}{0.25\baselineskip}
\setlength{\afterchapskip}{0.25\baselineskip}
\renewcommand{\printchapternum}{}

% Lettered sections, normal size bold font, centered, whitespace before/after
\setbeforesecskip{-0.45\baselineskip}
\setaftersecskip{0.25\baselineskip}
\setsecheadstyle{\normalfont\bfseries\centering}
\renewcommand{\thesection}{\Alph{section}}
\setsecnumformat{\csname the#1\endcsname:\quad}

% Lettered/numbered subsections, normal size bold font, whitespace before/after
\setbeforesubsecskip{-0.25\baselineskip}
\setaftersubsecskip{0.25\baselineskip}
\setsubsecheadstyle{\normalfont\bfseries}

% Unnumbered subsubsections and paragraphs, some whitespace before, inline bold
% title, whitespace after
\setsecnumdepth{subsection}
\setbeforesubsubsecskip{0.25\baselineskip}
\setaftersubsubsecskip{-\baselineskip}
\setbeforeparaskip{0.25\baselineskip}
\setafterparaskip{-\baselineskip}

% Number figures and tables continuously, not by chapter
\counterwithout{table}{chapter}
\counterwithout{figure}{chapter}

% URLs and other hyperlinks
\RequirePackage[bookmarks=false,
  pdfpagelabels=false,
  hyperfootnotes=false,
  hyperindex=false,
  pageanchor=false]{hyperref}

% How to turn on/off certain types (e.g. citation, url, file) of hyperref
% links? https://tex.stackexchange.com/a/117676
\let\saved@hyper@linkurl\hyper@linkurl
%\let\saved@hyper@linkfile\hyper@linkfile
\let\saved@hyper@link@\hyper@link@
\AtBeginDocument{%
  % Since the whole document is affected, only the \begin part of
  % environment `NoHyper' is needed.
  \NoHyper
  \let\hyper@linkurl\saved@hyper@linkurl % needed by \url
  %\let\hyper@linkfile\saved@hyper@linkfile % needed by \href{<file>}
  \let\hyper@link@\saved@hyper@link@ % needed by \href{<url>}
}

\endinput
