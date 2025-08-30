%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hayektex}[2024/04/25]

%Adapted from V.H. Belvadi's essay template
%Check out his work at https://vhbelvadi.com/

%OPTIONS{
\DeclareOption{center}{\newcommand{\@wantscenter}{}}
\DeclareOption{copyright}{\newcommand{\@copyright}{}}
\DeclareOption{authhead}{\newcommand{\@authhead}{}}
\DeclareOption{toc}{\newcommand{\@toc}{}}
\DeclareOption{title}{\newcommand{\@titpage}{}}
\DeclareOption{oldtitle}{\newcommand{\@oldtitpage}{}}
\DeclareOption{seccount}{\newcommand{\@seccount}{}}
%\DeclareOption{pic}{\newcommand{\@pic}{}}
\DeclareOption{linkpropthm}{\newcommand{\@linkpropthm}{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
%}
\DeclareRobustCommand{\\}{\par\vspace{1.5ex}\noindent}
\DeclareRobustCommand{\@stitle}{\@title}
\DeclareRobustCommand{\smallcaps}[1]{\scshape{#1}}
\LoadClass[letterpaper,11pt]{article}

%PACKAGES{

\RequirePackage[widermath]{kpfonts}
\RequirePackage[dvipsnames]{xcolor}
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
\ifthenelse{\isundefined{\@wantscenter}}{\geometry{verbose,letterpaper,top=1.25in,bottom=1.25in,left=1in,right=1.9in,asymmetric,twoside,marginparwidth=110pt,marginparsep=15pt}}{\geometry{verbose,letterpaper,top=1.45in,bottom=1.35in,left=1.25in,right=1.25in,asymmetric,twoside}}
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
%\RequirePackage{fontawesome}
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
\RequirePackage[colorlinks,linkcolor=purple,urlcolor=purple,citecolor=black]{hyperref}
%}

%SECTION FORMATTING{
%\newcommand{\@stitle}{}
\renewcommand{\@author}{}
\newcommand{\@email}{}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\subtitle}[1]{\newcommand{\@subtitle}{#1}}
\newcommand{\subsubtitle}[1]{\newcommand{\@subsubtitle}{#1}}
\renewcommand{\author}[1]{\renewcommand{\@author}{#1}}
\newcommand{\note}[1]{\newcommand{\@note}{#1}}
\renewcommand{\title}[1]{\renewcommand{\@title}{#1}}
\newcommand{\stitle}[1]{\renewcommand{\@stitle}{#1}}
\newcommand{\pic}[2][1]{\newcommand{\@pic}{#2}\newcommand{\@picsize}{#1}}

\titleformat{\section}{\relax\centering\large\lsstyle}{}{0.5em}{\otherscshape\MakeLowercase}
\titleformat{\subsection}{\relax\centering}{}{1em}{\large\itshape}
\titleformat{\subsubsection}{\relax}{}{0em}{\normalsize\textbf}
\titleformat{\paragraph}[runin]{}{}{}{\normalsize\smallcaps}


\newcounter{partNum}
\newcounter{secNum}

\newcommand{\thecurpart}{}
\let\oldpart\part
\renewcommand{\part}[1]{\stepcounter{partNum}\oldpart{\makebox[1.25em][l]{\Roman{partNum}} \quad #1}\renewcommand{\thecurpart}{#1}}

\pretocmd{\section}{\stepcounter{secNum}}{}{}
%\let\oldsection\section
%\renewcommand{\section}[1]{\stepcounter{secNum}\oldsection{#1}}

\renewcommand{\cftsecfont}{}
\setcounter{secnumdepth}{-1}
\setcounter{tocdepth}{3}
%}

%TEXT MACROS{
\newcommand{\runin}[1]{\textls[50]{\otherscshape #1}}
\newcommand{\say}[1]{\mt{\runin{#1}}}
%\newcommand{\margintext}[1]{\marginpar{\setstretch{.8}\upshape{\footnotesize{#1}}}}
\newcommand{\mt}[1]{\marginnote{\setstretch{.7}\upshape{\footnotesize{#1}}}}
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

\newcommand{\makeoldtitle}{
	\newgeometry{left=1in,right=1in}
	\begin{center}
			\rule{10cm}{0.4pt}\vspace{1cm}\\
			\large{\smallcaps{\textls[150]{\MakeUppercase{\@title}}}}
			
			\ifthenelse{\isundefined{\@subtitle}}{}{{\vskip 1.5ex\large\smallcaps{\textls[100]{\protect\MakeLowercase{\protect\otherscshape{\@subtitle}}}}}}
			
			\ifthenelse{\isundefined{\@author}}{}{{\vskip 1.5ex\large\smallcaps{\textls[100]{\protect\MakeLowercase{\protect\otherscshape{\@author}}}}}}
			\ifthenelse{\isundefined{\@note}}{}{{\vskip 2.5ex\textit{\@note}}}
			\\\vspace{2.5ex}\rule{3.5cm}{0.4pt}
			\newpage
		\end{center}
	\newpage
	\restoregeometry
}


\AtBeginDocument{
	\pagenumbering{gobble}
	\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
	\renewcommand{\cftsubsecleader}{\hfill}
	\ifthenelse{\isundefined{\@titpage}}{}{\maketitle}
	\ifthenelse{\isundefined{\@oldtitpage}}{}{\makeoldtitle}
	\ifthenelse{\isundefined{\@toc}}{}{\newgeometry{left=2in,right=2in,bottom=.5in, top=1in}\tableofcontents
		\ifthenelse{\isundefined{\@copyright}}{}{\vspace{\fill}\\\textcopyright \; \@author\; \the\year{} \;\; \href{mailto:\@email}{\faEnvelope[regular]}}\restoregeometry\newpage
	}
	\pagestyle{fancy}
	\pagenumbering{arabic}
	\\
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
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
%\newcommand{\code}[1]{\colorbox{backcolour}{\texttt{\footnotesize#1}}}
\newcommand{\code}[1]{\texttt{\footnotesize#1}}


\newcommand{\@theoremcolor}{Maroon}
\newcommand{\theoremcolor}[1]{\renewcommand{\@theoremcolor}{#1}}
\mdfdefinestyle{theorem}{
	roundcorner=10pt,
	linewidth=2pt,
	backgroundcolor=\@theoremcolor!10,
	linecolor=\@theoremcolor,
	nobreak=true}
\mdfdefinestyle{proof}{
	roundcorner=5pt,
	linewidth=0pt,
	backgroundcolor=gray!10,
	usetwoside=false,
%	tikzsetting={draw=white,line width=1pt,%
%		dashed}
}

\ifthenelse{\isundefined{\@seccount}}{\newcounter{propNum}[partNum]}{\newcounter{propNum}[secNum]}

%\newcounter{propNum}[partNum]
\newcommand{\prop}[1][-.2]{\noindent\stepcounter{propNum}\mt{\vspace{#1cm}\hypertarget{prop\arabic{partNum}.\arabic{propNum}}{\runin{\textbf{prop \scriptsize{\arabic{partNum}.\arabic{propNum}}}}}}}
\newcommand{\proplink}[1]{\hyperlink{prop#1}{\uline{Prop #1}}}

\newcounter{defNum}[partNum]
\newcommand{\define}[1][-.2]{\noindent\stepcounter{defNum}\mt{\vspace{#1cm}\hypertarget{def\arabic{partNum}.\arabic{defNum}}{\runin{def \scriptsize{\arabic{partNum}.\arabic{defNum}}}}}}
\newcommand{\deflink}[1]{\hyperlink{def#1}{\uline{Def #1}}}

\newcounter{theoremNum}[partNum]
\ifthenelse{\isundefined{\@linkpropthm}}{
	
\newenvironment{theorem}[1][]{\stepcounter{theoremNum}\begin{mdframed}[style=theorem]\renewcommand{\\}{\par\vspace{1.5ex}\noindent}\hypertarget{thm\arabic{partNum}.\arabic{theoremNum}}{\textbf{\arabic{partNum}.\arabic{theoremNum}\quad #1}}}
	{\end{mdframed}}

}{

\newenvironment{theorem}[1][]{\stepcounter{propNum}\begin{mdframed}[style=theorem]\renewcommand{\\}{\par\vspace{1.5ex}\noindent}\hypertarget{thm\arabic{partNum}.\arabic{propNum}}{\textbf{\arabic{partNum}.\arabic{propNum}\quad #1}}}
	{\end{mdframed}}

}

\newcommand{\thmlink}[1]{\hyperlink{thm#1}{\uline{Thm #1}}}

\newcounter{egNum}[partNum]

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
\newlist{examplelist}{enumerate}{1}
\setlist[examplelist,1]{
	label=\textbf{Eg. \arabic{partNum}.\arabic{egNum}.\arabic*},
	leftmargin=*,
	align=left}

%\newenvironment{eg}{
%\vspace{-.2cm}\stepcounter{egNum}\mt{\\\hypertarget{eg\arabic{partNum}.\arabic{egNum}}{\runin{e.g. \scriptsize{\arabic{partNum}.\arabic{egNum}}}}}\begin{mdframed}[style=example]\renewcommand{\\}{\par\vspace{1.5ex}\noindent}\begin{examplelist}
%}{
%\end{examplelist}\end{mdframed}
%}

\newenvironment{eg}{
	\vspace{-.2cm}\stepcounter{egNum}\begin{mdframed}[style=example]\renewcommand{\\}{\par\vspace{1.5ex}\noindent}\hypertarget{eg\arabic{partNum}.\arabic{egNum}}{}\begin{examplelist}
		}{
	\end{examplelist}\end{mdframed}
}


\newenvironment{example}{
	\stepcounter{egNum}\noindent\xrfill[2pt]{.75pt}[black]\,$\spadesuit$\,\textit{Examples}\,$\clubsuit$\,\xrfill[2pt]{.75pt}[black]
	\mt{\vspace*{-.1cm}\hypertarget{eg\arabic{partNum}.\arabic{egNum}}{\runin{e.g. \scriptsize{\arabic{partNum}.\arabic{egNum}}}}}
	\\\noindent\ignorespaces
}{
	\\\noindent\xrfill[2pt]{.75pt}[black]
}
\newcommand{\eglink}[1]{\hyperlink{eg#1}{\uline{Example #1}}}

%\renewenvironmentx{proof}[2][1=\qed, 2=proof.]{\def\endArg{#1}\say{\vspace{.5cm}\\#2}\MakeFramed\\}
%		{\hfill\endArg\endMakeFramed}

\renewenvironmentx{proof}[2][1=\qed, 2=proof.]{\def\endArg{#1}\begin{mdframed}[style=proof]\renewcommand{\\}{\par\vspace{1.5ex}\noindent}\say{\vspace{-.5cm}\\#2}}
	{\hfill\endArg\end{mdframed}}

%}