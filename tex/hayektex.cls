\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hayektex}[2026/01/06]

\usepackage{filecontents}
\begin{filecontents*}{\jobname.ist}
	item_0 "\n \\item \\small "
	delim_0 " \\hfill "
	delim_1 " \\hfill "
	delim_2 " \\hfill "
\end{filecontents*}

%OPTIONS{
\DeclareOption{center}{\newcommand{\@wantscenter}{}}
\DeclareOption{index}{\newcommand{\@wantsindex}{}}
\DeclareOption{authhead}{\newcommand{\@authhead}{}}
\DeclareOption{toc}{\newcommand{\@toc}{}}
\DeclareOption{title}{\newcommand{\@titpage}{}}
\DeclareOption{copyright}{\newcommand{\@copyright}{}}
\DeclareOption{labelbox}{\newcommand{\@labelbox}{}}
\DeclareOption{linkpropthm}{\newcommand{\@linkpropthm}{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
%}
\DeclareRobustCommand{\\}{\par\vspace{1.5ex}\noindent}
\DeclareRobustCommand{\@stitle}{\@title}
\DeclareRobustCommand{\smallcaps}[1]{\scshape{#1}}
\LoadClass[letterpaper,11pt]{article}

%PACKAGES{

%Fonts and colors
\RequirePackage[widermath]{kpfonts}
\RequirePackage[dvipsnames,x11names]{xcolor}
\newcommand{\@theoremcolor}{Maroon}
\newcommand{\theoremcolor}[1]{\renewcommand{\@theoremcolor}{#1}}
\newcommand{\@accentcolor}{purple}
\newcommand{\accentcolor}[1]{\renewcommand{\@accentcolor}{#1}}
\newcommand{\@codecolor}{OliveGreen}
\newcommand{\codecolor}[1]{\renewcommand{\@codecolor}{#1}}


\RequirePackage{tikz}
\RequirePackage{etoolbox}
\RequirePackage{enumitem}
\RequirePackage{framed}
\usetikzlibrary{arrows}
\usetikzlibrary{patterns}
\usetikzlibrary{shapes}
\RequirePackage{pgfplots}
\RequirePackage{graphicx}
\RequirePackage{sourcecodepro}
\RequirePackage{geometry}
\RequirePackage{ifthen}
\ifthenelse{\isundefined{\@wantscenter}}{\geometry{verbose,letterpaper,top=1.25in,bottom=1in,left=1in,right=1.6in,asymmetric,twoside,marginparwidth=1.15in,marginparsep=15pt}}{\geometry{verbose,letterpaper,top=1.25in,bottom=1in,left=1.25in,right=1.25in,asymmetric,twoside}}
\RequirePackage{empheq}
\RequirePackage[framemethod=TikZ, xcolor]{mdframed}
\RequirePackage{fancyhdr}
\RequirePackage{xargs}
\RequirePackage{mathdots}
\RequirePackage{microtype}
\RequirePackage{stmaryrd}
\RequirePackage{titlesec}
\RequirePackage[titles]{tocloft}
\RequirePackage{textcase}
\RequirePackage{setspace}
\RequirePackage{xfrac}
\RequirePackage{xhfill}
\RequirePackage{mathtools}
\RequirePackage{faktor}
\RequirePackage[normalem]{ulem}
\RequirePackage{cancel}
\RequirePackage{mparhack}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{csquotes}
\RequirePackage{epigraph}
\RequirePackage[fixed]{fontawesome5}
\DeclareMathAlphabet{\bignum}{U}{BOONDOX-ds}{m}{n}
\newcommand{\1}{\bignum{1}}
\newcommand{\0}{\bignum{0}}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amsxtra}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{mathrsfs}
\RequirePackage{marginnote}
\usepackage[color=none, linecolor=none, bordercolor=none]{todonotes}
\RequirePackage{imakeidx}
\RequirePackage[colorlinks, citecolor=black]{hyperref}
%}

%SECTION FORMATTING{
\newcommand{\email}[1]{\newcommand{\@email}{#1}}
\newcommand{\website}[1]{\newcommand{\@website}{#1}}
\renewcommand{\date}[1]{\newcommand{\@mydate}{#1}}

\renewcommand{\@author}{}
\newcommand{\subtitle}[1]{\newcommand{\@subtitle}{#1}}
\newcommand{\subsubtitle}[1]{\newcommand{\@subsubtitle}{#1}}
\renewcommand{\author}[1]{\renewcommand{\@author}{#1}}
\newcommand{\note}[1]{\newcommand{\@note}{#1}}
\renewcommand{\title}[1]{\renewcommand{\@title}{#1}}
\newcommand{\stitle}[1]{\renewcommand{\@stitle}{#1}}
\newcommand{\titlepic}[2][1]{\newcommand{\@pic}{#2}\newcommand{\@picsize}{#1}}

\titleformat{\section}{\relax\centering\large\lsstyle}{}{0.5em}{\otherscshape\MakeLowercase}
\titleformat{\subsection}{\relax}{}{1em}{\large\itshape}
\titleformat{\subsubsection}{\relax}{}{0em}{\normalsize\otherscshape\MakeLowercase}
\titleformat{\paragraph}[runin]{}{}{}{\normalsize\bfseries}

\newcounter{partNum}

\newcommand{\thecurpart}{}

\let\oldpart\part
\renewcommand{\part}{\@ifstar{\@starpart}{\@nostarpart}}
\newcommand{\@nostarpart}[1]{%
		\stepcounter{partNum}\addcontentsline{toc}{part}{\makebox[1.25em][l]{\Roman{partNum}}\quad#1}{\\\vspace{3pt}\huge\bfseries\makebox[1.25em][l]{\Roman{partNum}}\quad#1}%
		\renewcommand{\thecurpart}{#1}
}
\newcommand{\@starpart}[1]{%
		\stepcounter{partNum}\addcontentsline{toc}{part}{#1}{\\\vspace{3pt}\huge\bfseries#1}%
		\renewcommand{\thecurpart}{#1}
}


\renewcommand{\cftsecfont}{}
\setcounter{secnumdepth}{-1}
\setcounter{tocdepth}{2}
%}

%MARGIN MACROS{
\newcommand{\runin}[1]{\textls[50]{\otherscshape #1}}
\newcommand{\say}[1]{\mtr{
			\ifthenelse{\isundefined{\@labelbox}}{%
					\runin{#1}%
				}{%
					\colorbox{gray!10}{\runin{#1}}%
				}%
			}%
		}%
\renewcommand*{\marginfont}{\footnotesize}
\newcommand{\mtr}[1]{\reversemarginpar\marginnote{#1}\normalmarginpar}
\newcommand{\mt}[1]{\marginnote{#1}}

%Old macro
\newcommand{\margintext}{\mt}
%}

%TITLE PAGE AND TOC{
\renewcommand{\maketitle}{
	\newgeometry{left=1.5in,right=1.5in, top=2in, bottom=2in}
		
	\Huge{\noindent \textbf{\@title}}
	\ifthenelse{\isundefined{\@subtitle}}{}{{\vskip .5ex\LARGE{\protect{\noindent \@subtitle}}}}
	
	\ifthenelse{\isundefined{\@subsubtitle}}{}{\vskip .5ex\Large\noindent\@subsubtitle}
	
	\ifthenelse{\isundefined{\@pic}}{}{
		\vfill
		\begin{center}
			\includegraphics[scale=\@picsize]{\@pic}
		\end{center}
		
	}
	
	
	\vfill
	\ifthenelse{\isundefined{\@author}}{}{{\LARGE{\protect{\noindent\@author}}}}
	
	\ifthenelse{\isundefined{\@note}}{}{{\LARGE{\noindent\textit{\@note}}}}
	
	\normalsize
	\restoregeometry
}

\AtBeginDocument{
	\pagenumbering{gobble}
	\newcounter{frontpages}
	\renewcommand{\cftpartpagefont}{\Large\bfseries}
	\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
	\renewcommand{\cftsecpagefont}{\normalfont}
	\renewcommand{\cftsecindent}{2.5em}
	\renewcommand{\cftsubsecleader}{\hfill}
	\renewcommand{\cftsubsecpagefont}{\hphantom}
	\renewcommand{\cftsubsecfont}{\small\itshape}
	\renewcommand{\cftsubsecindent}{3.25em}
	\setlength{\cftbeforesecskip}{.6em}
	\hypersetup{linkcolor=\@accentcolor,urlcolor=\@accentcolor}
	%
	\ifthenelse{\isundefined{\@titpage}}{}{\maketitle\stepcounter{frontpages}}
	\ifthenelse{\isundefined{\@toc}}{}{%
		\newgeometry{left=2in,right=2in,bottom=.5in, top=1in}\tableofcontents
		\ifthenelse{\isundefined{\@copyright}}{}{%
		\vspace{\fill}\\\textcopyright \;%
		\ifthenelse{\isundefined{\@mydate}}{\the\year}{%
			\@mydate
		}%
		\,\@author\;%
		\ifthenelse{\isundefined{\@email}}{}{%
			\href{mailto:\@email}{\faEnvelope[regular]}%
		}%
		\ifthenelse{\isundefined{\@website}}{}{%
			\href{\@website}{\faGlobeAmericas}%
		}%
		}\restoregeometry%
	%
		\newpage\stepcounter{frontpages}%
	}%
	\pagestyle{fancy}
	\pagenumbering{arabic}
	\setcounter{page}{\value{frontpages}}
	\stepcounter{page}
}
%Index creation
\ifthenelse{\isundefined{\@wantsindex}}{}{%
	\indexsetup{toclevel=part}
	\makeindex[title=Index of Definitions, intoc, options= -s \jobname.ist]	
	\AtEndDocument{%	
		\clearpage\pagenumbering{gobble}
		\printindex
	}%
}


%HEADERS{
\cfoot{}
\ifthenelse{\isundefined{\@stitle}}{
	\fancyhead[LE]{\smallcaps\protect\MakeUppercase{\expandafter\@title}}
}{
\fancyhead[LE]{\smallcaps\protect\MakeLowercase{\@stitle}}
}

\fancyhead[RE]{\smallcaps\thepage}
\ifthenelse{\isundefined{\@authhead}}{
	\fancyhead[RO]{\smallcaps\protect\MakeLowercase{\protect\textls[70]{\thecurpart}}}
}{
	\fancyhead[RO]{\smallcaps\protect\MakeLowercase{\protect\textls[70]{\@author}}}
}
\fancyhead[LO]{\smallcaps\thepage}
%}

%ENVIORNMENTS{
\newcommand{\code}[1]{\textcolor{\@codecolor}{\texttt{\footnotesize#1}}}
\mdfdefinestyle{theorem}{
	roundcorner=5pt,
	innertopmargin=6pt,
	innerbottommargin=6pt,
	innerleftmargin=6pt,
	innerrightmargin=10pt,
	linewidth=1pt,
	skipabove=10pt,
	skipbelow=10pt,
	backgroundcolor=\@theoremcolor!20,
	linecolor=\@theoremcolor,
	nobreak=true}
\mdfdefinestyle{proof}{
	roundcorner=5pt,
	linewidth=0pt,
	backgroundcolor=gray!10,
	usetwoside=false,
}
\mdfdefinestyle{example}{
	linecolor=black,
	style=dashed,
	linewidth=1pt,
	roundcorner=5pt,
	innertopmargin=6pt,
	innerbottommargin=6pt,
	innerleftmargin=6pt,
	innerrightmargin=10pt,
	skipabove=10pt,
	skipbelow=10pt
}
\newcounter{propNum}[partNum]

\newcommand{\prop}[1][-.35cm]{%
	\noindent\stepcounter{propNum}%
	\mtr{%
		\vspace{#1}\\%
		\hypertarget{%
			prop\arabic{partNum}.\arabic{propNum}%
			}{%
			\ifthenelse{\isundefined{\@labelbox}}{%
				\runin{\textbf{prop \scriptsize{\arabic{partNum}.\arabic{propNum}}}}%
			}{%
				\colorbox{gray!10}{%
					\runin{\textbf{prop \scriptsize{\arabic{partNum}.\arabic{propNum}}}}%
				}%
			}%
		}%
	}%
}

\newcommand{\proplink}[1]{\hyperlink{prop#1}{\uline{Prop #1}}}

\newcounter{defNum}[partNum]

\DeclareRobustCommand{\defindexentry}[1]{\hyperlink{def#1}{#1}}
\newcommand{\NoPage}[1]{}


\newcommand{\define}[2][]{%
	\edef\thisdefkey{%
		\if\relax\detokenize{#1}\relax#2%
		\else#1\fi%
	}%
	\textcolor{\@accentcolor}{\textit{#2}}%
	\noindent%
	\stepcounter{defNum}%
	\edef\thisdeflabel{\arabic{partNum}.\arabic{defNum}}%
	\expandafter\xdef\csname deflabel@\thisdefkey\endcsname{\thisdeflabel}%
	\mtr{
		\vspace{-.35cm}\\\hypertarget{def\thisdeflabel}{%
			\ifthenelse{\isundefined{\@labelbox}}{%
				\runin{def \scriptsize{\thisdeflabel}}%
			}{%
				\colorbox{gray!10}{\runin{def \scriptsize{\thisdeflabel}}}%
			}%
		}%
	}%
	\index{#2@#2\;\defindexentry{\thisdeflabel}|NoPage}%
}

\newcommand{\deflink}[1]{%
	\edef\foundlabel{\csname deflabel@#1\endcsname}%
	\hyperlink{def\foundlabel}{\uline{Def \foundlabel}}%
}

\newcounter{theoremNum}[partNum]

\ifthenelse{\isundefined{\@linkpropthm}}{
	
	\newenvironment{theorem}[1][]{\stepcounter{theoremNum}\begin{mdframed}[style=theorem]\renewcommand{\\}{\par\vspace{1.5ex}\noindent}\hypertarget{thm\arabic{partNum}.\arabic{theoremNum}}{\textbf{Theorem \arabic{partNum}.\arabic{theoremNum}\quad #1}}}
		{\end{mdframed}}

}{

	\newenvironment{theorem}[1][]{\stepcounter{propNum}\begin{mdframed}[style=theorem]\renewcommand{\\}{\par\vspace{1.5ex}\noindent}\hypertarget{thm\arabic{partNum}.\arabic{propNum}}{\textbf{\arabic{partNum}.\arabic{propNum}\quad #1}}}
		{\end{mdframed}}

}
\newcommand{\thmlink}[1]{\hyperlink{thm#1}{\uline{Thm #1}}}


%EXAMPLE ENVIRONMENT
\newcounter{exampleitem}[partNum]
\newlist{examplelist}{enumerate}{1}
\setlist[examplelist,1]{
	label=\textbf{Eg. \arabic{partNum}.\arabic{examplelisti}},
	ref=\arabic{partNum}.\arabic{examplelisti},
	leftmargin=*,
	align=left,
	resume=exampleitem,
	before={\setcounter{examplelisti}{\value{exampleitem}}\let\olditem\item\renewcommand{\item}{\olditem\hypertarget{eg\arabic{partNum}.\arabic{examplelisti}}{}}},
	after=\setcounter{exampleitem}{\value{examplelisti}}
}
\newenvironment{eg}{
	\vspace{-.2cm}\begin{mdframed}[style=example]\renewcommand{\\}{\par\vspace{1.5ex}\noindent}\begin{examplelist}
		}{
	\end{examplelist}\end{mdframed}
}
\newcommand{\eglink}[1]{\hyperlink{eg#1}{\uline{Example #1}}}

\renewenvironmentx{proof}[2][1=\qed,2=proof.]{%
	\def\endArg{#1}%
	\begin{mdframed}[style=proof]%
		\renewcommand{\\}{\par\vspace{1.5ex}\noindent}%
		\reversemarginpar\mt{\vspace{-.55cm}\\%
			\ifthenelse{\isundefined{\@labelbox}}{%
				\runin{#2}%
			}{%
			\ifstrempty{#2}{}{\colorbox{gray!10}{\runin{#2}}}%
			}%
		}%
	}{%
		\hfill\endArg\normalmarginpar\end{mdframed}%
	}

%}