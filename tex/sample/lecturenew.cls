\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenew}
\RequirePackage{ifthen}
\RequirePackage[nodayofweek]{datetime}

%%%%%%%%%  REFERENCES
\newcommand{\notes@lang}{english}
\newcommand{\notes@lecturename}{Lecture}
\newcommand{\notes@theoremname}{theorem}
\newcommand{\notes@propositionname}{proposition}
\newcommand{\notes@lemmaname}{lemma}
\newcommand{\notes@corollaryname}{corollary}
\newcommand{\notes@definitionname}{definition}
\newcommand{\notes@examplename}{example}
\newcommand{\notes@exercisename}{exercise}
\newcommand{\notes@remarkname}{remark}
\newcommand{\notes@factname}{fact}
\newcommand{\notes@problemname}{problem}
\newcommand{\notes@conjecturename}{conjecture}
\newcommand{\notes@claimname}{claim}
\newcommand{\notes@notationname}{notation}
\newcommand{\notes@morelinkname}{For more visit}
\newcommand{\notes@header}{title}

%%%%%%%%%%%  OPTIONS ON DOC
\DeclareOption{theoremnosection}{\newcommand{\notes@theorem}{nosection}}
\DeclareOption{theoremsection}{\newcommand{\notes@theorem}{section}}
\DeclareOption{theoremsubsection}{\newcommand{\notes@theorem}{subsection}}

\DeclareOption{cleardoublepage}{\newcommand{\notes@cleardoublepage}{true}}
\DeclareOption{nocleardoublepage}{\newcommand{\notes@cleardoublepage}{false}}

\DeclareOption{oneside}{\newcommand{\notes@side}{oneside}}
\DeclareOption{twoside}{\newcommand{\notes@side}{twoside}}

\DeclareOption{onecolumn}{\newcommand{\notes@columns}{onecolumn}}
\DeclareOption{twocolumn}{\newcommand{\notes@columns}{twocolumn}}

\DeclareOption{course}{
  \newcommand{\notes@type}{course}
  \ifthenelse{\isundefined{\notes@header}}{\ExecuteOptions{headersubsection}}{}
  \ifthenelse{\isundefined{\notes@theorem}}{\ExecuteOptions{theoremsection}}{}
  \ifthenelse{\isundefined{\notes@cleardoublepage}}{\ExecuteOptions{nocleardoublepage}}{}
  \ifthenelse{\isundefined{\notes@columns}}{\ExecuteOptions{onecolumn}}{}
  \ifthenelse{\isundefined{\notes@side}}{\ExecuteOptions{twoside}}{}
}

\DeclareOption{toc}{\newcommand{\notes@toc}{toc}}
\DeclareOption{notoc}{\newcommand{\notes@toc}{notoc}}

%%%%%%%DEFAULT OPTION
\ifthenelse{\isundefined{\notes@type}}{\ExecuteOptions{course}}{}
\ProcessOptions
%%%%%%%CHANGE PAPER SIZE HERE (1/2) A4PAPER OR LETTERPAPER
\LoadClass[a4paper,11pt,\notes@columns,\notes@side]{article}
\ifthenelse{\isundefined{\notes@type}}{\ExecuteOptions{course}}{}


%%%%%%%A BUNCHA PACKAGES

\RequirePackage[widermath,narrowiints,fullsumlimits,fullintlimits]{kpfonts}


	\RequirePackage[dvipsnames]{xcolor}
	\RequirePackage{tikz}
	\usetikzlibrary{arrows}
	\usetikzlibrary{patterns}
	\usetikzlibrary{shapes}
	\RequirePackage{pgfplots}
	\RequirePackage{graphicx}

		%%%%%%THEOREM MDFRAMED
		\RequirePackage{empheq}
		\RequirePackage[framemethod=TikZ, xcolor]{mdframed}
			\mdfdefinestyle{theorem}{%
				roundcorner=10pt,
				linewidth=2pt,
				backgroundcolor=orange!10,
				linecolor=RawSienna}
			\mdfdefinestyle{proof}{%
				roundcorner=5pt,
				linewidth=0pt,
				backgroundcolor=gray!10}

\RequirePackage{fancyhdr}
\RequirePackage{mathdots}
\RequirePackage{microtype}
\RequirePackage{stmaryrd}
\RequirePackage{titlesec}
\newcommand{\contentsfinish}{}
\RequirePackage[titles]{tocloft}
\RequirePackage{textcase}
\RequirePackage{setspace}
\RequirePackage{xfrac}
\RequirePackage{mathtools}
\RequirePackage{faktor}
\RequirePackage{cancel}
\RequirePackage{mparhack}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage[fixlanguage]{babelbib}
\RequirePackage{csquotes}
\RequirePackage{epigraph}


\linespread{1.05}
\addtolength{\jot}{0.5em}
%%%%%%CHANGE PAPER SIZE HERE (2/2) A4PAPER OR LETTERPAPER
\RequirePackage[verbose,a4paper,top=1.45in,bottom=1.35in,left=1.15in,right=2in,asymmetric,twoside]{geometry}
\setlength\headheight{14pt}
\RequirePackage[\notes@lang]{babel}
\RequirePackage[colorlinks,linkcolor=black,urlcolor=black,citecolor=black]{hyperref}


\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amsxtra}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{mathrsfs}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%SHORTCUTS
\newcommand{\R}{\mathbb{R}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\N}{\mathbb{N}}

\renewcommand{\P}{\mathbb{P}}
\renewcommand{\epsilon}{\varepsilon}
\renewcommand{\phi}{\varphi}
\renewcommand{\ss}[1]{\textsuperscript{#1}}

%%%%%%%MARGINS
\delimitershortfall=5pt
\frenchspacing
\DeclareRobustCommand{\smallcaps}[1]{\scshape{#1}}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}
    \vspace*{\fill}
    \vspace{\fill}
    \thispagestyle{empty}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi\fi\fi}
\newcommand{\margintext}[1]{\marginpar{\setstretch{.8}\upshape{\footnotesize{#1}}}}
\newcommand{\separator}{\begin{center}\rule{\columnwidth}{\arrayrulewidth}\end{center}}
\newcommand{\tosay}[1]{\begin{center}\text{\fbox{\scriptsize{#1}}}\end{center}}
\newcounter{notes@lecture}
\newcommand{\lecture}[4][]{%
  \addtocounter{notes@lecture}{1}%
  \newdate{@datelecture#2#3#4}{#2}{#3}{#4}%
  \margintext{\notes@lecturename{}\ \arabic{notes@lecture} \ifthenelse{\equal{#1}{}}{}{\ (#1)}\\ \displaydate{@datelecture#2#3#4}}%
}
\newcommand{\TODO}{\margintext{TODO}}%

%%%%%%%SECTION FORMATS
\newcommand{\notes@opensection}{}
\ifthenelse{\equal{\notes@cleardoublepage}{true}}{\renewcommand{\notes@opensection}{\cleardoublepage\thispagestyle{plain}}}{}
\titleformat{\subsection}{\relax\centering}{\thesubsection}{1em}{\large\itshape}
\titleformat{\subsubsection}{\relax\centering}{\thesubsubsection}{1em}{\normalsize}
\titleformat{\paragraph}[runin]{}{}{}{\normalsize\smallcaps}
\PassOptionsToPackage{letterspace=1000}{microtype}
\titleformat{\section}{\relax\centering\large\lsstyle}{\small{\thesection}}{0.5em}{\otherscshape\MakeLowercase}
\PassOptionsToPackage{letterspace=0}{microtype}
\renewcommand{\cftsecfont}{\normalfont}%
\renewcommand{\cftsecpagefont}{\normalfont}%
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}
\renewcommand{\descriptionlabel}[1]{\hspace*{\labelsep}\smallcaps{#1}}


%%%%%%%%%PREAMBLE STUFF
\renewcommand{\date}[3]{\newcommand{\notes@datestartdef}{}\newdate{@date}{#1}{#2}{#3}}
\newcommand{\dateend}[3]{\newcommand{\notes@dateenddef}{}\newdate{@dateend}{#1}{#2}{#3}}
\newcommand{\season}[1]{\newcommand{\notes@season}{#1}}
\newcommand{\ccode}[1]{\newcommand{\notes@ccode}{#1}}
\newcommand{\email}[1]{\newcommand{\notes@email}{#1}}
\newcommand{\spemail}[1]{\newcommand{\notes@spemail}{#1}}
\newcommand{\speaker}[1]{\newcommand{\notes@speaker}{#1}}
\newcommand{\subtitle}[1]{\newcommand{\notes@subtitle}{#1}}
\newcommand{\shorttitle}[1]{\newcommand{\notes@shorttitle}{#1}}
\newcommand{\flag}[1]{\newcommand{\notes@flag}{#1}}
\newcommand{\place}[1]{\newcommand{\notes@place}{#1}}
\newcommand{\conference}[1]{\newcommand{\notes@conference}{#1}}
\newcommand{\subject}[1]{\newcommand{\notes@subject}{#1}}
\newcommand{\attn}[1]{\newcommand{\notes@attn}{#1}}
\newcommand{\morelink}[1]{\newcommand{\notes@morelink}{#1}}


%%%%%%%%%%EQUATION ALIGNMENT AND ALIGN ENVIONMENT
\AtBeginDocument{%
\let\oldequation=\equation%
\let\endoldequation=\endequation%
\renewenvironment{equation}{\vspace{0ex}\begin{oldequation}}{\vspace{2ex}\end{oldequation}}%
\setlength{\abovedisplayskip}{2ex}%
\setlength{\abovedisplayshortskip}{0ex}%
\setlength{\belowdisplayskip}{2ex}%
\setlength{\belowdisplayshortskip}{2ex}%
\renewcommand{\\}{\par\vspace{1ex}\noindent}%
\newcommand{\nl}{\par\noindent}%
\newcommand{\runin}[1]{\textls[50]{\otherscshape #1}}


%%%%%%%%%TWO COLUMN FORMAT AND SECTION NUMBERING
  \ifthenelse{\equal{\notes@columns}{twocolumn}}
             {
               \setlength{\abovedisplayskip}{0mm}%
               \setlength{\belowdisplayskip}{0mm}%
               \setlength{\parskip}{0mm}%
               \setlength{\topsep}{0mm}%
             }{}
  \pagestyle{fancy}
  \ifthenelse{\equal{\notes@header}{title}}
             {
               \renewcommand{\sectionmark}[1]{}
               \renewcommand{\subsectionmark}[1]{}
             }{}
  \ifthenelse{\equal{\notes@header}{section}}
             {
               \renewcommand{\sectionmark}[1]{\markboth{{\footnotesize\thesection}.\ \smallcaps{#1}}{\thesection.\ \smallcaps{#1}}}
               \renewcommand{\subsectionmark}[1]{}
             }{}
  \ifthenelse{\equal{\notes@header}{subsection}}
             {
               \renewcommand{\sectionmark}[1]{\markboth{{\scriptsize\thesection}.\ \smallcaps{#1}}{}}
               \renewcommand{\subsectionmark}[1]{\markright{{\scriptsize\thesubsection}.\ \smallcaps{#1}}}
             }{}
         

%%%%%%PAGE NUMBER FORMATTING
  \newcommand\partcontent{}
  \fancyhf{}
  \ifthenelse{\equal{\notes@header}{title}}{
  \ifthenelse{\isundefined{\notes@ccode}}{}{
  \fancyhead[RE]{\protect\MakeUppercase{\footnotesize\textls[50]{\notes@ccode}}}
  }
	%%%%%%%ON EVEN PAGES, TITLE LEFT PAGE # RIGHT
    \ifthenelse{\isundefined{\notes@shorttitle}}{
      \fancyhead[LE]{\smallcaps\@title}
      \fancyhead[RE]{\smallcaps\thepage}}{
      \fancyhead[LE]{\smallcaps\protect\MakeLowercase{\protect\textls[70]{\notes@shorttitle}}}}
  
  	%%%%%%%ON ODD PAGES, AUTHOR RIGHT PAGE # LEFT
    \ifthenelse{\isundefined{\notes@speaker}}{
      \fancyhead[RO]{\smallcaps\protect\MakeLowercase{\protect\textls[70]{\@author}}}}{
      \fancyhead[RO]{\smallcaps\protect\MakeLowercase{\protect\textls[70]{\partcontent}}}
      \fancyhead[LO]{\smallcaps\thepage}}
  }
             {
               \fancyhead[LE]{\smallcaps\protect\MakeLowercase{\protect\textls[70]{\leftmark}}}
               \fancyhead[RO]{\smallcaps\protect\MakeLowercase{\protect\textls[70]{\rightmark}}}
             }

  \ifthenelse{\equal{\notes@header}{no}}%
    {\renewcommand{\headrulewidth}{0pt}%
    \fancyhead[LE]{}%
    \fancyhead[RO]{}%
    }%
    {\renewcommand{\headrulewidth}{0.5pt}}

  \ifthenelse{\isundefined{\notes@subtitle}}{\subtitle{}}{}
  \ifthenelse{\isundefined{\notes@subject}}{\subject{}}{}
  \ifthenelse{\isundefined{\notes@email}}{\email{}}{}
  \ifthenelse{\isundefined{\notes@speaker}}{\speaker{}}{}
  \ifthenelse{\isundefined{\notes@speaker}}{\speaker{}}{}
  \ifthenelse{\isundefined{\notes@spemail}}{\spemail{}}{}
  \ifthenelse{\isundefined{\notes@season}}{\season{}}{}
  \ifthenelse{\isundefined{\notes@flag}}{\flag{}}{}
  %\ifthenelse{\isundefined{\notes@morelink}}{\morelink{}}{}
  \ifthenelse{\isundefined{\notes@conference}}{\conference{}}{}
  \ifthenelse{\isundefined{\notes@place}}{\place{}}{}

  \hypersetup{
    pdftitle={\@title},
    pdfsubject={\notes@subject},
    pdfauthor={\@author},
    pdfkeywords={\notes@speaker{}:\notes@conference{}:\notes@place{}},
  }
  \pdfinfo{/ModDate (D:\pdfdate)}
  \maketitle
  
  \ifthenelse{\equal{\notes@toc}{toc}}{\tableofcontents}{}
  
}

%%% Common structures

\renewcommand\maketitle{\par
  \begingroup
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
  \long\def\@makefntext##1{\parindent 1em\noindent
    \hb@xt@1.8em{%
      \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
  \@maketitle
  \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
}

\renewcommand{\@maketitle}{
  \newpage
  \null
  \vskip 4ex%
  \begin{center}%
    \let \footnote \thanks
    \ifthenelse{\isundefined{\notes@ccode}}{}{%
    \protect\textls[100]{\protect\MakeUppercase{\notes@ccode}} --- %
    }%
    {\large\smallcaps\protect\textls[100]{\protect\MakeUppercase{\@title}}}%
    \ifthenelse{\isundefined{\notes@subtitle}}{}{%
    {\vskip 1.5ex\large\smallcaps\protect\textls[100]{\protect\MakeLowercase{\protect\otherscshape{\notes@subtitle}}}}%
    }%
    {\ifthenelse{\isundefined{\notes@speaker}}{}{%
    \ifthenelse{\equal{\notes@spemail}{}}{%
    {\vskip 1.5ex\normalsize\protect\MakeLowercase{\smallcaps\protect\textls[75]{\protect\otherscshape{\notes@speaker}}}}%
    }{%
    \ifthenelse{\equal{\notes@email}{}}{%
      {\vskip 1.5ex\normalsize\protect\MakeLowercase{\smallcaps\protect\textls[75]{\protect\otherscshape{\notes@speaker}}}}\footnote{\protect\href{mailto:\notes@spemail}{\notes@spemail}}%
      }{%
    {\vskip 1.5ex\normalsize\protect\MakeLowercase{\smallcaps\protect\textls[75]{\protect\otherscshape{\notes@speaker}}}}\footnote{\protect\href{mailto:\notes@spemail}{\notes@spemail} (speaker)}%
    }}%
    \par}}%
    \vskip 1.5em%
    {\large
    \begin{tabular}[t]{c}%
      \ifthenelse{\equal{\notes@email}{}}{%
        {\small\itshape\@author}%
      }{%
      \ifthenelse{\equal{\notes@speaker}{}}{%
      {\small\itshape\@author}\footnote{\href{mailto:\notes@email}{\notes@email}}%
      }{%
        {\small\itshape\@author}\footnote{\href{mailto:\notes@email}{\notes@email} (scribe)}%
      }}%
    \end{tabular}\par}%
    \vskip 2ex%
    \ifthenelse{\equal{\notes@flag}{}}{}%
      {%
        {\small\itshape\notes@flag}%
        \vskip 1ex%
      }%
    \ifthenelse{\equal{\notes@conference}{}}%
    {%
      \ifthenelse{\equal{\notes@place}{}}{}%
      {%
        {\small\itshape\notes@place}%
        \vskip 1ex%
      }%
    }%
    {%
      \ifthenelse{\equal{\notes@place}{}}%
      {%
        {\small\itshape\notes@conference}%
        \vskip 1ex%
      }%
      {%
        {\small\itshape\notes@conference, \notes@place}%
        \vskip 1ex%
      }%
    }
    \ifthenelse{\isundefined{\season}}{% If season not defined
    \ifthenelse{\isundefined{\notes@dateenddef}}{%
    \ifthenelse{\isundefined{\notes@datestartdef}}{}{%
    {\small\itshape\displaydate{@date}}%
    }}{%
    {\small\itshape\displaydate{@date} -- \displaydate{@dateend}}}%
    }
    {% If season is defined
    {\itshape\notes@season}%
    }%
    \ifthenelse{\isundefined{\notes@attn}}{}{\vskip 3ex%
    {\itshape\notes@attn}%
    }%
    \ifthenelse{\isundefined{\notes@morelink}}{}{%
    \let\thefootnote\relax%
    \footnotetext{%
    \notes@morelinkname \ \url{\notes@morelink}.
    }%
    \addtocounter{footnote}{-1}\let\thefootnote\svthefootnote%
    }%
    \vskip 3ex\noindent\rule{1.5cm}{0.4pt}%
  \end{center}%
  \par \newpage
  \vskip 2ex
}

\newcommand{\makedefaultsection}[2][true]{
  \ifthenelse{\equal{\notes@toc}{toc}}{
    \ifthenelse{\equal{#1}{true}}{\addcontentsline{toc}{section}{#2}}{}
    \section*{#2}
    \ifthenelse{\equal{\notes@header}{section}}{\markboth{\smallcaps{#2}}{\smallcaps{#2}}}{}
    \ifthenelse{\equal{\notes@header}{subsection}}{\markboth{\smallcaps{#2}}{}}{}}{}
  \ifthenelse{\equal{\notes@type}{seminar}}{
    \ifthenelse{\equal{#1}{true}}{\addcontentsline{toc}{subsection}{#2}}{}
    \subsection*{#2}
    \ifthenelse{\equal{\notes@header}{subsection}}{\markright{\smallcaps{#2}}}{}}{}
  \ifthenelse{\equal{\notes@type}{talk}}{
    \ifthenelse{\equal{#1}{true}}{\addcontentsline{toc}{subsection}{#2}}{}
    \subsection*{#2}
    \ifthenelse{\equal{\notes@header}{subsection}}{\markright{\smallcaps{#2}}}{}}{}
}

\renewcommand{\tableofcontents}{%
  \makedefaultsection[false]{\contentsname}
  \@starttoc{toc}\vskip 7ex%
  }

\renewenvironment{thebibliography}[1]{
  \makedefaultsection{\refname}
  \list{\@biblabel{\@arabic\c@enumiv}}%
       {\settowidth\labelwidth{\@biblabel{#1}}%
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
       \sloppy
       \clubpenalty4000
       \@clubpenalty \clubpenalty
       \widowpenalty4000%
       \sfcode`\.\@m%
}{
  \def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
