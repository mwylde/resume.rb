% resume class v1.1
% 02/07/1997
% written by Miklos Csuros csuros@cs.yale.edu
%
% features
% 
% 1	\address[2] command for home and office address
%
% 2	category environment for resume sections
%       
%       \citem[1]  	for items of the section with argument emphasized
%       \citemnobullet 	for items of the section without a bullet
%       \citembullet    for items of the section with bullet & no emphasis
% 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[1997/02/07 v1.1 resume class]

\newif\if@wideadress\@wideadressfalse
\DeclareOption{wideadress}{\@wideadresstrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}



% -------------------------------------------------------
%  The following definitions can be changed in the LaTeX
%  file for a different look but the same structure. The 
%  rest of this file defines the structure and the 
%  commands.
% -------------------------------------------------------

\newcommand{\titlenamefont}{\bf\LARGE}	% the font used to print the name
					% on the top of the 1st page
\newcommand{\categoryfont}{\sl}		% font used to print the category
					% names
\newcommand{\labelcitem}{\labelitemi}	% the bullet produced by \citem or
					% \citembullet
\reversemarginpar			% so that category names are on the
					% left for one-sided document and
					% left-right-left-... for two-sided

% -------------------------------------------------------
% - changing lengths
% -------------------------------------------------------

\setlength{\topmargin}{0in}
\setlength{\textheight}{9.0in}
\setlength{\oddsidemargin}{1.5in}		% left margin on first page
\setlength{\evensidemargin}{\oddsidemargin}

\newlength{\titlewidth}
\newlength{\addresswidth}
% -------------------------------------------------------
% - new commands
% -------------------------------------------------------

%%%%%%% \address                                       
\gdef\@addressA{\ClassWarning{resume}{%
	No address given.\MessageBreak
	Use \protect\address.}}
\newcommand{\address}[2]{\gdef\@addressA{#1}\gdef\@addressB{#2}}

%%%%%%% \author
\gdef\@author{\ClassError{resume}{%
	No author given.}{%
	Use \protect\author\space to specify it.}}

%%%%%% category environment
\newif{\if@firstitem}
\newenvironment{category}[1]%
   {\@firstitemtrue
   \def\makecategorytitle{%
   	\marginpar{\categoryfont\raggedright #1}}
   \par
   \begin{list}{}{%
      \setlength{\leftmargin}{0in}	% no extra left margin before bullets
      \setlength{\parsep}{0in}
      }}
   {\end{list}}


%%%%%%% \citem
\newcommand*{\citem}[1]{%
   \if@firstitem
      {\item[\labelcitem]{\bf #1}\makecategorytitle}%
   \else
      {\item[\labelcitem]{\bf #1}}%
   \fi
   \@firstitemfalse}

%%%%%%% \citemnobullet
\newcommand{\citemnobullet}{%
	\if@firstitem
		\item[] \leavevmode\makecategorytitle
	\else
		\item[]
	\fi
	\@firstitemfalse}

%%%%%%% \citembullet
\newcommand{\citembullet}{%
	\if@firstitem
		\item[\labelcitem] \leavevmode\makecategorytitle
	\else
		\item[\labelcitem]
	\fi
	\@firstitemfalse}

%%%%%%% \maketitle
\renewcommand{\maketitle}{%
	\setlength{\titlewidth}{\textwidth}
	\setlength{\addresswidth}{.5\textwidth}
  \begingroup
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@makeresumetitle
      \else
        \twocolumn[\@makeresumetitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@makeresumetitle
    \fi
    \thispagestyle{empty}
  \endgroup
  \if@twoside
      \markboth{\@author}{\@author}
  \else
      \markright{\hfill\@author\hfill}
  \fi
  \pagestyle{myheadings}
  \renewcommand{\thepage}{}	% because only the name is 
  				% needed in the heading and no pagenumbers
  
  \setcounter{footnote}{0}%
  \let\thanks\relax
  \let\maketitle\relax\let\@makeresumetitle\relax
  \gdef\@thanks{}\gdef\@author{}\gdef\@title{}}
  
\def\@makeresumetitle{%
  \newpage
  \null
	\def\@moveleft{\hspace*{-\marginparwidth}\hspace*{-\marginparsep}}
  \@moveleft\makebox[\titlewidth]{\titlenamefont\@author}\\
  \@moveleft
  	\parbox[t]{\addresswidth}{\begin{flushleft}\@addressA\end{flushleft}}\hfill%
  \parbox[t]{\addresswidth}{\begin{flushright}\@addressB\end{flushright}}
  \par
  \vskip 1.5em}
  
\endinput

