\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nefuthesis}[2023/10/01 v1.0.0 NEFU Thesis Class]
\LoadClass[twoside,a4paper]{article}
%========================================%
% 加载需要的宏包
%========================================%
\RequirePackage[UTF8,fontset=windows]{ctex}
\ifdefined\setCJKfamilyfont
  \setCJKfamilyfont{zhhei}{SimHei}[AutoFakeBold=2]
  \setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold=3]
\fi
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{hyperref}
\RequirePackage{url}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{amsfonts}
\RequirePackage{nicefrac}
\RequirePackage{lipsum}
\RequirePackage{enumitem}
\RequirePackage{geometry}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{bm}                  % 提供\bm命令用于粗体数学符号
\RequirePackage{mathrsfs}
\RequirePackage{ntheorem}
\RequirePackage{color}
\RequirePackage{cite}
\RequirePackage{mathtools}
\RequirePackage{listings}
\RequirePackage{setspace}
\RequirePackage{times}
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{tocloft}
\RequirePackage{ctexsize}
\RequirePackage{type1cm}
\RequirePackage{titlesec}
\RequirePackage{caption}
\RequirePackage{fancyhdr}
\RequirePackage{xstring}
\RequirePackage{ifthen}
\RequirePackage[sort&compress]{gbt7714}
\RequirePackage{float}

%========================================%
% 设置文档相关格式
%========================================%
\geometry{a4paper,left=2.4cm,right=2.4cm,top=2.6cm,bottom=2.4cm} % Word标准页面

%========================================%
% 超链接设置
%========================================%
\hypersetup{
	colorlinks=true,
	linkcolor=black,
	filecolor=black,
	urlcolor=blue,
	citecolor=black,
}

%========================================%
% 设置文档全局通用命令
%========================================%
\newcommand{\yihao}{\fontsize{26pt}{39pt}\selectfont}
\newcommand{\xiaoyi}{\fontsize{24pt}{36pt}\selectfont}
\newcommand{\erhao}{\fontsize{22pt}{33pt}\selectfont}
\newcommand{\xiaoer}{\fontsize{18pt}{27pt}\selectfont}
\newcommand{\sanhao}{\fontsize{16pt}{24pt}\selectfont}
\newcommand{\xiaosan}{\fontsize{15pt}{22.5pt}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{21pt}\selectfont}
\newcommand{\xiaosi}{\fontsize{12pt}{18pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{15.75pt}\selectfont}
\newcommand{\xiaowu}{\fontsize{9pt}{13.5pt}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{11.25pt}\selectfont}
\newcommand{\cnspacing}[2][0.5em]{%
  \begingroup
  \StrLen{#2}[\nef@len]%
  \count@=1\relax
  \loop\ifnum\count@<\nef@len\relax
    \StrChar{#2}{\the\count@}\hspace{#1}%
    \advance\count@ by 1\relax
  \repeat
  \ifnum\nef@len>0\relax
    \StrChar{#2}{\nef@len}%
  \fi
  \endgroup
}
\newcommand{\sep}{~}

\citestyle{numbers} % 国标引用格式
\newcommand{\citeup}[1]{\textsuperscript{\cite{#1}}}

\theorembodyfont{\upshape}
\newtheorem{theorem}{定理}[section]
\newtheorem{definition}{定义}[section]
\newtheorem{lemma}{引理}[section]
\newtheorem{example}{例}[section]
\newtheorem{deduction}{推论}[section]
\newtheorem{proposition}{命题}[section]
\newtheorem{property}{性质}[section]
\newtheorem{remark}{注释}[section]
\newenvironment{proof}[1][证明]{\noindent{\heiti{#1}}\quad}{\hfill $\square$\par}
\newenvironment{solve}[1][解]{\noindent{\heiti{#1}}\quad}{\hfill $\square$\par}

\numberwithin{equation}{section}
\numberwithin{table}{section}
\numberwithin{figure}{section}

\renewcommand {\thetable} {\thesection{}-\arabic{table}}
%根据学校模板定义表名
\renewcommand {\thefigure} {\thesection{}-\arabic{figure}}
%根据学校模板定义图名
\renewcommand {\theequation} {\thesection{}-\arabic{equation}}

% 图表标题格式
\captionsetup[figure]{font=small,name={图},labelsep=space}
\captionsetup[table]{font={small},name={表},labelsep=space,justification=raggedright}

%========================================%
% 文档相关命令
%========================================%
% 双线页眉设置
\def\headrule{{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi%
\hrule\@height 0.5pt \@width\headwidth\vskip1pt%上面线为0.5pt粗
\hrule\@height 0.5pt\@width\headwidth  %下面0.5pt粗
\vskip-2\headrulewidth\vskip-1pt}      %两条线的距离1pt
  \vspace{6mm}}     %双线与下面正文之间的垂直间距

\renewcommand{\baselinestretch}{1.0}% 设置行间距
\let\oldsection\section
\renewcommand{\section}{\clearpage\oldsection}
\titlespacing*{\section}
  {0pt}{*}{5pt}
\titlespacing*{\subsection}
  {0pt}{*}{5pt}
\titlespacing*{\subsubsection}
  {0pt}{*}{5pt}

% ====== 封面信息存储命令 ======%
%=========内部命令============%
\newcommand\@schoolcode{10225}
\newcommand\@studentid{}
\newcommand\@titlecn{}
\newcommand\@titleen{}
\newcommand\@authorcn{}
\newcommand\@authoren{}
\newcommand\@supervisorcn{}
\newcommand\@supervisoren{}
\newcommand\@supervisortitlecn{}
\newcommand\@supervisortitleen{}
\newcommand\@degreecn{硕士}
\newcommand\@degreeen{Master Degree}
\newcommand\@specialtycn{数学}
\newcommand\@specialtyen{Mathematics}
\newcommand\@subdate{}
\newcommand\@defensedatecn{}
\newcommand\@defensedateen{}
\newcommand\@universitycn{东北林业大学}
\newcommand\@universityen{Northeast Forestry University}
\newcommand\@grantdate{}
\newcommand\@chairman{}
\newcommand\@reviewer{}


% 学校代码
\newcommand\schoolcode[1]{
  \renewcommand\@schoolcode{#1}
}
% 学号
\newcommand\studentid[1]{
  \renewcommand\@studentid{#1}
}
% 中英文标题
\renewcommand\title[2]{
  \renewcommand\@titlecn{#1}
  \renewcommand\@titleen{#2}
  }
% 中英文作者
\renewcommand\author[2]{
  \renewcommand\@authorcn{#1}
  \renewcommand\@authoren{#2}
  }
% 指导老师及职称
\newcommand\supervisor[4]{
  \renewcommand\@supervisorcn{#1}
  \renewcommand\@supervisortitlecn{#2}
  \renewcommand\@supervisoren{#3}
  \renewcommand\@supervisortitleen{#4}
}
% 学位级别
\newcommand\degree[2]{
  \renewcommand\@degreecn{#1}
  \renewcommand\@degreeen{#2}
}
% 学科专业
\newcommand\specialty[2]{
  \renewcommand\@specialtycn{#1}
  \renewcommand\@specialtyen{#2}
}
% 论文提交日期
\newcommand\subdate[1]{
  \renewcommand\@subdate{#1}
}
% 答辩日期
\newcommand\defensedate[2]{
  \renewcommand\@defensedatecn{#1}
  \renewcommand\@defensedateen{#2}
}
% 授予学位单位
\newcommand\university[2]{
  \renewcommand\@universitycn{#1}
  \renewcommand\@universityen{#2}
}
% 授予学位日期
\newcommand\grantdate[1] {
  \renewcommand\@grantdate{#1}
}
% 答辩委员会主席
\newcommand\chairman[1]{
  \renewcommand\@chairman{#1}
}
% 评阅人
\newcommand\reviewer[1]{
  \renewcommand\@reviewer{#1}
}

% ====== 封面生成命令 ======
\newcommand{\makecover}{
  \clearpage
  \thispagestyle{empty}
  %======= 中文封面 =======%
  \pagenumbering{gobble}
  \setcounter{page}{1}
  \vspace{0.5cm}
  \begin{flushright}
    \hspace*{0pt}\hspace{-1pt}%
    \begin{tabular}{ll}
      {\songti  \sihao   {学校代码：}}&{\sihao \@schoolcode }\\
      {\songti \sihao   学\quad\quad  号：} &{\sihao \@studentid }
    \end{tabular}
  \end{flushright}
  \vspace{0.5cm}
  \begin{center}
    \includegraphics[width=7.8cm]{pictures/Cover/logo1.png}

    \vspace{1.35cm}

    % 封面内容
    {\heiti \erhao \@titlecn\\\vspace{0.2cm}}

    \vspace{2.2cm}
    {\kaishu \xiaoyi \@authorcn}
    \vspace{1.5cm}
    \begin{table}[!h]
      \centering
        \tabcolsep=0.5cm
	    \renewcommand\arraystretch{2.2}
        \begin{tabular}{llll}
            {\heiti \sihao 指导教师姓名：}&{\songti \sihao  \@supervisorcn \quad \@supervisortitlecn}&{ \songti \sihao \@universitycn }&\\%
            {\heiti \sihao 申请学位级别：}&{\songti \sihao \cnspacing{\@degreecn}}&{\heiti \sihao 学\ \ \ 科\ \ \  专\ \  业：} &{\songti \sihao \cnspacing{\@specialtycn}}\\
            {\heiti \sihao 论文提交日期：}&{\songti \sihao \@subdate}& {\heiti \sihao 论文答辩日期：} &{\songti \sihao \@defensedatecn}\\
            {\heiti \sihao 授予学位单位：}&{\songti \sihao  \@universitycn}& {\heiti \sihao 授予学位日期：} &{\songti \sihao \@grantdate}
        \end{tabular}
        \vspace{1cm}
        \begin{tabular}{rrrl}
         &\multicolumn{2}{r} {\quad \quad\quad\heiti  \sihao 答辩委员会主席：}&{\songti \sihao \@chairman}\\
         &\multicolumn{2}{r} {\quad \quad\quad \heiti \sihao  论\ \ 文\ \ 评\ \ 阅\ \ 人：} &{\songti \sihao \@reviewer}
        \end{tabular}
    \end{table}

    \vspace{2.2cm}
    \includegraphics[width=6.8cm]{pictures/Cover/logo2.png}
  \end{center}
  \clearpage

  %======= 英文封面 =======%
  \pagenumbering{gobble}
  \vspace{0.5cm}
  \begin{flushright}
    \begin{tabular}{ll}
      {\xiaosi University Code:}&{\xiaosi \@schoolcode }\\
      {\xiaosi Register Code:} &{\xiaosi \@studentid }
    \end{tabular}
  \end{flushright}
  \vspace{2cm}
  \begin{center}
    {\xiaoer Dissertation for the Degree of Master}
    
    \vspace{2cm}
    
    {\erhao \@titleen\\\vspace{0.2cm}}
    
    \vspace{3cm}
  \end{center}
  \begin{table}[!h]
    \centering
    \tabcolsep=0.5cm
    \renewcommand\arraystretch{2.2}
    \begin{tabular}{ll}
      {\sihao \bfseries Candidate:}&{\sihao \@authoren}\\
      {\sihao \bfseries Supervisor:} &  {\sihao \@supervisoren \quad \@supervisortitleen}\\
      {\sihao \bfseries Associate Supervisor:}&{\sihao }\\
      {\sihao \bfseries Academic Degree Applied for:}&{\sihao \@degreeen}\\
      {\sihao \bfseries Speciality:}&{\sihao \@specialtyen}\\
      {\sihao \bfseries Date of Oral Examination:}&{\sihao \@defensedateen}\\
      {\sihao \bfseries University:}&{\sihao \@universityen}
    \end{tabular}
  \end{table}
  \clearpage
}


%========================================%
% 中英文摘要环境
%========================================%
\RenewDocumentEnvironment{abstract}{ O{cn} O{1} m }{%
  % 参数说明：
  % #1 = 语言选项 (cn/en)，默认为cn
  % #2 = 摘要页码
  % #3 = 关键词内容
  \def\abstract@keywords{#3}%
  \def\abstract@lang{#1}%
  \clearpage
  \pagenumbering{Roman}%
  \setcounter{page}{#2}%
  \pagestyle{fancy}%
  \fancyhf{}%
  \ifthenelse{\equal{#1}{cn}}{% 中文摘要
    \fancyhead[C]{\songti \xiaowu 摘要}
    \phantomsection\addcontentsline{toc}{section}{摘要}
    \begin{center}
      {\heiti \xiaoer \bfseries 摘要}
    \end{center}
    \songti \xiaosi \indent
  }{% 英文摘要
    \fancyhead[C]{\xiaowu Abstract}
    \phantomsection\addcontentsline{toc}{section}{Abstract}
    \begin{center}
      {\xiaoer \bfseries Abstract}
    \end{center}
    \normalfont \xiaosi \indent
  }
  
  \fancyfoot[CO, CE]{\thepage}%
}{%
  \vspace{1cm}
  \par
  \noindent
  \ifthenelse{\equal{\abstract@lang}{cn}}{% 中文关键词
    {\heiti \xiaosi \textbf{关键词}\quad\heiti \xiaosi \abstract@keywords}
  }{% 英文关键词
    {\normalfont \bfseries \xiaosi Keywords\quad\normalfont \xiaosi \abstract@keywords}
  }
  \clearpage
}

%========================================%
% 目录命令
%========================================%
% 目录点线样式
\newcommand{\nef@tocfill}[2]{%
  \leaders\hbox{$\m@th\mkern #1 mu\hbox{#2}\mkern #1 mu$}\hfill
}
\renewcommand\cftsecdotsep{0.6}
\renewcommand{\cftsecleader}{\nef@tocfill{\cftsecdotsep}{$\cdot$}}
\renewcommand{\cftsubsecleader}{\hspace{0.3em}\nef@tocfill{0.6}{.}}
\renewcommand{\cftsubsubsecleader}{\hspace{0.3em}\nef@tocfill{0.6}{.}}

% 目录条目间距
\setlength{\cftbeforesecskip}{5pt}
\setlength{\cftbeforesubsecskip}{5pt}
\setlength{\cftbeforesubsubsecskip}{5pt}
\setlength{\cftbeforepartskip}{10pt}
\setlength{\cftaftertoctitleskip}{10pt}
\setlength{\cftsubsecindent}{0pt}
\setlength{\cftsubsecnumwidth}{24pt}
\setlength{\cftsubsubsecindent}{0pt}
\setlength{\cftsubsubsecnumwidth}{30pt}

% 目录条目字体设置
\renewcommand{\cftsecfont}{\heiti\xiaosi}
\renewcommand{\cftsubsecfont}{\songti\xiaosi}
\renewcommand{\cftsubsubsecfont}{\songti\xiaosi}
\renewcommand{\cftsecpagefont}{\heiti\xiaosi}
\renewcommand{\cftsubsecpagefont}{\songti\xiaosi}
\renewcommand{\cftsubsubsecpagefont}{\songti\xiaosi}

% 目录标题居中
\renewcommand*\contentsname{目录}
\setlength{\cftsecindent}{0pt}

% 一级标题格式
\titleformat{\section}
    {\centering\xiaoer\heiti\bfseries}
    {\thesection \quad}
    {0pt}
    {}

% 二级标题格式
\titleformat{\subsection}
    {\raggedright\xiaosan\heiti\bfseries}
    {\thesubsection \quad}
    {0pt}
    {}

% 三级标题格式
\titleformat{\subsubsection}
    {\raggedright\sihao\heiti\bfseries}
    {\thesubsubsection \quad}
    {0pt}
    {}

\newcommand{\content}{
  \clearpage % 新建页
  %%%%%%%%%%%%%%%%%%%%%目录%%%%%%%%%%%%%%%%%%
  \begingroup
  \raggedbottom
  \pagestyle{fancy}
  \fancyhf{}
  %C：页面中间；O：奇数页；\leftmark：表示“一级标题”
  \fancyhead[CO, CE]{\songti \xiaowu  目录}
  %C：页面中间；E：偶数页；\rightmark：表示"二级标题"
  \fancyfoot[CO, CE]{\thepage}
  \fancypagestyle{plain}{
    \fancyhf{}
    \fancyhead[CO, CE]{\songti \xiaowu  目录}
    \fancyfoot[CO, CE]{\thepage}
  }

  \begin{spacing}{1}
  \centering
  \begingroup
  \tableofcontents
  \endgroup
  \end{spacing}

  \clearpage
  \endgroup
}


%========================================%
% 正文环境命令
%========================================%
\newenvironment{thesis}{
  \clearpage	% 新建页
  %%%%%%%%%%%%%%%%%正文设置%%%%%%%%%%%%%%%
  \pagenumbering{arabic}%恢复页码设置
  \setcounter{page}{1} % 从下面开始编页码
  \renewcommand{\baselinestretch}{1.0}%%设置行间距
  \pagestyle{fancy}
  \fancyhf{}
  %C：页面中间；O：奇数页；\leftmark：表示“一级标题”
  \fancyhead[CO]{\songti \xiaowu \nouppercase{\leftmark}}
  %C：页面中间；E：偶数页；\rightmark：表示"二级标题"
  \fancyhead[CE]{\songti \xiaowu 东北林业大学硕士学位论文}
  % 设置页脚，页眉的位置上也可以放置页码
  \fancyfoot[CO, CE]{\thepage}

  \songti \xiaosi
  \theorembodyfont{\bfseries\upshape}
}{
  \clearpage
}

%========================================%
% 附录环境命令
%========================================%
\newenvironment{Appendix}{
  \clearpage	% 新建页
  \renewcommand{\baselinestretch}{1.0}%%设置行间距
  \pagestyle{fancy}
  \fancyhf{} % 清除页眉页脚
  % 设置页眉和页脚
  \fancyhead[CO]{\songti \xiaowu 附录}
  \fancyhead[CE]{\songti \xiaowu 东北林业大学硕士学位论文}
  \fancyfoot[CO, CE]{\thepage}
  \section*{附录}
  \phantomsection\addcontentsline{toc}{section}{附录}%放进目录
  \songti \xiaosi
}{
  \clearpage
}

%========================================%
% 结论环境命令
%========================================%
\newenvironment{conclusion}{
    \clearpage	% 新建页
    \renewcommand{\baselinestretch}{1.0}%%设置行间距
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[CO]{\songti \xiaowu  结论}
    \fancyhead[CE]{\songti \xiaowu 东北林业大学硕士学位论文}
    \fancyfoot[CO, CE]{\thepage}
    \section*{结论}
    \phantomsection\addcontentsline{toc}{section}{结论}%放进目录
    \songti \xiaosi
}{%
    \clearpage
}

%========================================%
% 参考文献命令和环境
%========================================%
% 参考文献(bibtex)
\newcommand{\references}[1]{%
  \clearpage
  \begingroup
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[CO]{\songti \xiaowu  参考文献}
  \fancyhead[CE]{\songti \xiaowu 东北林业大学硕士学位论文}
  \fancyfoot[CO, CE]{\thepage}
  \section*{参考文献}
  \phantomsection\addcontentsline{toc}{section}{参考文献}%放进目录
  \songti \xiaosi

  % BibTeX 生成的 thebibliography 环境内部会调用 \section*{\refname}。
  % 这里只需要隐藏那一行“自动标题”，不能把 \section 全局改掉，否则后续章节标题都会消失。
  \renewcommand{\section}[2]{}%
  \bibliographystyle{gbt7714-unsrt-no-uppercase.bst} % 国标引用格式
  % \bibliographystyle{unsrt-custom.bst}
  \bibliography{#1}
    \clearpage
  \endgroup
}

% 参考文献(bibitem)
% \newenvironment{biblist}{
%   \pagestyle{fancy}
%   \fancyhf{}
%   \fancyhead[CO]{\songti \wuhao  参考文献}
%   \fancyhead[CE]{\songti \wuhao 东北林业大学本科毕业论文}
%   \fancyfoot[CO, CE]{- \thepage\ -}
%   \section*{参考文献}
%   \renewcommand{\section}[2]{}
%   \phantomsection\addcontentsline{toc}{section}{参考文献}%放进目录
%   \bibliographystyle{gbt7714-numerical} % 国标引用格式
%   \begin{thebibliography}{99}% 参考文献，{}内表示序号最大位数（两位）
% }{
% \end{thebibliography}
% }

%========================================%
% 已发表论文环境
%========================================%
\newenvironment{published}{
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[CO, CE]{\songti \xiaowu  攻读学位期间发表的学术论文}
    \fancyfoot[CO, CE]{\thepage}
    \section*{攻读学位期间发表的学术论文}
    \phantomsection\addcontentsline{toc}{section}{攻读学位期间发表的学术论文}%放进目录
    \songti \xiaosi
}
{
  \clearpage
}

%========================================%
% 致谢环境
%========================================%
\newenvironment{acknowledgement}{
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[CO, CE]{\songti \xiaowu  致谢}
    \fancyfoot[CO, CE]{\thepage}
    \section*{致谢}
    \phantomsection\addcontentsline{toc}{section}{致谢}%放进目录
    \songti \xiaosi
}
{
  \clearpage
}

% 原创性声明和版权授权书
\newcommand{\declaration}{
    \clearpage % 新建页
    \thispagestyle{empty}
    \begingroup
      \centering
      {\heiti \xiaoer \cnspacing[1.1em]{独创性声明}\par}
    \endgroup
    \vspace{0.8cm}

    {\songti \sihao
    \setlength{\parindent}{2em}
    \indent 本人声明所呈交的论文是我个人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得东北林业大学或其它教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示了谢意。\par}
    \vspace{1.8cm}

    {\songti \sihao
    \noindent\hspace{2em}学位论文作者签名：\hfill 签字日期：\hspace{3em}年\hspace{2em}月\hspace{2em}日\hspace{2em}\par}
    \vspace{2.2cm}

    \begingroup
      \centering
      {\heiti \xiaoer 学位论文版权使用授权书\par}
    \endgroup
    \vspace{0.8cm}

    {\songti \sihao
    \setlength{\parindent}{2em}
    \indent 本人完全了解东北林业大学有关保留、使用学位论文的规定，即：学校有权保留送交论文的复印件，允许论文被查阅和借阅；学校可以公布论文的全部或部分内容，可以采用影印、缩印或其他复制手段保存、汇编学位论文。\par
    \noindent\hspace{2em}{\heiti （保密的论文在解密后应遵守此规定）}\par}
    \vspace{1.35cm}

    {\songti \sihao
    \noindent\hspace{2em}\makebox[0.52\textwidth][l]{学位论文作者签名：}\makebox[0.36\textwidth][l]{导师签名：}\par
    \vspace{0.85cm}

    \noindent\hspace{2em}\makebox[0.52\textwidth][l]{签字日期：\hspace{2.4em}年\hspace{1.6em}月\hspace{1.6em}日}\makebox[0.36\textwidth][l]{签字日期：\hspace{2.4em}年\hspace{1.6em}月\hspace{1.6em}日}\par
    \vspace{1.3cm}

    \noindent 学位论文作者毕业后去向：\par
    \vspace{0.35cm}

    \noindent\makebox[0.58\textwidth][l]{工作单位：}\makebox[0.42\textwidth][l]{电话：}\par
    \vspace{0.25cm}

    \noindent\makebox[0.58\textwidth][l]{通讯地址：}\makebox[0.42\textwidth][l]{邮编：}\par}

}
