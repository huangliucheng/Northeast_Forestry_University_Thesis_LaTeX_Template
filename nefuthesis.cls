\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nefuthesis}[2023/10/01 v1.0.0 NEFU Thesis Class]
\LoadClass[UTF8,AutoFakeBold,twoside,a4paper]{article}

\PassOptionsToPackage{patch=}{microtype}

%========================================%
% 加载需要的宏包
%========================================%
\RequirePackage[UTF8]{ctex} % 加载ctex包
\RequirePackage[utf8]{inputenc} % allow utf-8 input
\RequirePackage[T1]{fontenc}    % use 8-bit T1 fonts
\RequirePackage{hyperref}       % hyperlinks
\RequirePackage{url}            % simple URL typesetting
\RequirePackage{booktabs}       % professional-quality tables
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{amsfonts}       % blackboard math symbols
\RequirePackage{nicefrac}       % compact symbols for 1/2, etc.
\RequirePackage{microtype}      % microtypography
\RequirePackage{lipsum}
\RequirePackage{enumitem}
\RequirePackage{geometry}
\RequirePackage{amsmath}
\RequirePackage{ntheorem}
\RequirePackage{cite}
\RequirePackage{listings}
\RequirePackage{setspace}
\RequirePackage{times}          % 英文使用Times New Roman
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage[subfigure]{tocloft}      %必须这么写，否则会报错
\RequirePackage{caption}
\RequirePackage{fancyhdr}
\RequirePackage{fontspec}
\RequirePackage{titletoc}
\RequirePackage{type1cm}
\RequirePackage{titlesec}       %定义各级标题的格式
\RequirePackage{gbt7714}        % 国标引用格式
\RequirePackage{xstring}
\RequirePackage{ifthen}
\RequirePackage{xparse}

%========================================%
% 设置文档相关格式
%========================================%
\geometry{a4paper,left=2.4cm,right=2.4cm,top=2.6cm,bottom=2.4cm} % Word标准页面
\citestyle{numbers} % 引用格式
\setmainfont{TeX Gyre Termes}

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
  \StrLen{#2}[\mylen]%
  \newcounter{i}%
  \setcounter{i}{1}% % 从第一个字符开始
  \whiledo{\value{i}<\mylen\relax}{% % 注意添加 \relax
    \StrChar{#2}{\thei}%
    \hspace{#1}% % 输出当前字符+空格
    \stepcounter{i}%
  }%
  \ifnum\mylen>0\relax % 确保字符串非空
    \StrChar{#2}{\mylen}% % 直接使用 \mylen
  \fi
}
\newcommand{\sep}{~}

\newtheorem{theorem}{定理}[section]
\newtheorem{definition}{定义}[section]
\newtheorem{lemma}{引理}[section]
\newtheorem{example}{例}[section]
\newtheorem{deduction}{推论}[section]
\newenvironment{proof}[1][证明]{\noindent{\heiti{#1}}\quad}{\hfill $\square$\par}
\newenvironment{solve}[1][解]{\noindent{\heiti{#1}}\quad}{\hfill $\square$\par}


%========================================%
% 文档相关命令
%========================================%
\renewcommand{\headrule}{%
\hrule width\headwidth height 0.5pt \vskip1pt
\hrule width\headwidth height 0.5pt
\vskip6mm
}
\renewcommand{\baselinestretch}{1.0}% 设置行间距
\let\oldsection\section
\renewcommand{\section}{\clearpage\oldsection}



% ====== 封面信息存储命令 ======
\newcommand\@schoolcode{10225} % 默认学校代码
\newcommand\schoolcode[1]{\renewcommand\@schoolcode{#1}}

\newcommand\@universitylogo{pictures/Cover/logo.png}
\newcommand\universitylogo[1]{\renewcommand\@universitylogo{#1}}

\newcommand\@degreeinfo{硕士毕业论文}
\newcommand\degreeinfo[1]{\renewcommand\@degreeinfo{#1}}

\newcommand\@college{}
\newcommand\college[1]{\renewcommand\@college{#1}}

\newcommand\@major{}
\newcommand\@class{}
\newcommand\major[2]{%
  \renewcommand\@major{#1}%
  \renewcommand\@class{#2}%
}

\newcommand\@studentid{}
\newcommand\studentid[1]{\renewcommand\@studentid{#1}}

\newcommand\@supervisor{}
\newcommand\@supervisortitle{}
\newcommand{\supervisor}[2]{%
  \renewcommand\@supervisor{#1}%
  \renewcommand\@supervisortitle{#2}%
}

\renewcommand\title[1]{\renewcommand\@title{#1}}
\renewcommand\author[1]{\renewcommand\@author{#1}}
\renewcommand\date[1]{\renewcommand\@date{#1}} 

% ====== 封面生成命令 ======
\newcommand\makecover{
  \clearpage
  \pagenumbering{gobble}
  \begin{titlepage}
    \vspace*{0.5cm}
    \raggedleft{\songti\sihao 学校代码：\@schoolcode}
    
    \centering
    \vspace{1cm}
    \includegraphics[width=7.24cm]{\@universitylogo}
    
    \vspace{1cm}
    {\heiti\fontsize{42pt}{1.2}\selectfont \cnspacing{\@degreeinfo}}
    
    \vspace{2cm}
    {\heiti\erhao{\@title\par}}
    
    \vspace{3cm}
    {\kaishu\xiaoyi \@author}
    
    \vspace{0.8cm}
    \begin{table}[!h]
        \centering
        \tabcolsep=0.5cm
        \renewcommand\arraystretch{2.2}
        \begin{tabular}{lc}
            \heiti\sihao 学\quad \quad 院： & 
            \songti\sihao \@college \\ 
            \cline{2-2} 
            
            \heiti\sihao 专业班级： & 
            \songti\sihao \@major ~ \@class \\ 
            \cline{2-2} 
            
            \heiti\sihao 指导教师： & 
            \songti\sihao \@supervisor\quad\@supervisortitle \\ 
            \cline{2-2} 
            
            \heiti\sihao 学\quad \quad 号： & 
            \songti\sihao \@studentid \\ 
            \cline{2-2} 
          \end{tabular}
    \end{table}
    
    \vspace{2cm}
    {\songti\sihao \@date}
  \end{titlepage}
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
    \fancyhead[C]{\songti \wuhao 摘要}
    \phantomsection\addcontentsline{toc}{section}{摘要}
    \begin{center}
      {\heiti \xiaoer 摘要}
    \end{center}
    \songti \xiaosi \indent
  }{% 英文摘要
    \fancyhead[C]{\normalfont \wuhao Abstract}
    \phantomsection\addcontentsline{toc}{section}{Abstract}
    \begin{center}
      {\normalfont \bfseries \xiaoer Abstract}
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
    {\normalfont \bfseries \xiaosi Keywords:\quad\normalfont \xiaosi \abstract@keywords}
  }
  \clearpage
}

%========================================%
% 目录命令
%========================================%
% 目录点线样式
\renewcommand\cftsecdotsep{0.6}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsubsecleader}{\cftdotfill{0.6}}
\renewcommand{\cftsubsubsecleader}{\cftdotfill{0.6}}

% 目录条目间距
\setlength{\cftbeforesecskip}{2pt}
\setlength{\cftbeforesubsecskip}{2pt}
\setlength{\cftbeforesubsubsecskip}{2pt}
\setlength{\cftbeforepartskip}{10pt}

% 目录条目字体设置
\renewcommand{\cftsecfont}{\heiti\xiaosi}
\renewcommand{\cftsubsecfont}{\songti\xiaosi}
\renewcommand{\cftsubsubsecfont}{\songti\xiaosi}

% 目录标题设置
\renewcommand*\contentsname{\centering 目录}
\setlength{\cftsecindent}{0pt}

% 超链接颜色
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    filecolor=black,
    urlcolor=blue,
    citecolor=black
}

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

% 目录内容格式
\titlecontents{subsection}[2.3em]
    {\songti\xiaosi}
    {\contentslabel{2em}}
    {}
    {~\titlerule*[0.3pc]{$.$}~\contentspage}

\titlecontents{subsubsection}[2.8em]
    {\songti\xiaosi}
    {\contentslabel{2.5em}}
    {}
    {~\titlerule*[0.3pc]{$.$}~\contentspage}

\newcommand{\content}{
    \clearpage % 新建页
    %%%%%%%%%%%%%%%%%%%%%目录%%%%%%%%%%%%%%%%%%
    \phantomsection\addcontentsline{toc}{section}{目录}%放进目录
    \fancypagestyle{plain}{\pagestyle{fancy}}
    \fancyhf{}
    %C：页面中间；O：奇数页；\leftmark：表示“一级标题”
    \fancyhead[CO, CE]{\songti \wuhao  目录}
    %C：页面中间；E：偶数页；\rightmark：表示“二级标题”
    \fancyfoot[CO, CE]{\thepage\ }

    \begin{spacing}{1}
    \centering
    \tableofcontents % 目录
    \end{spacing}
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
  \fancyhead[CO]{\songti \wuhao  \leftmark}
  %C：页面中间；E：偶数页；\rightmark：表示“二级标题”
  \fancyhead[CE]{\songti \wuhao 东北林业大学本科毕业论文}
  % 设置页脚，页眉的位置上也可以放置页码
  \fancyfoot[CO, CE]{- \thepage\ -}

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
  \fancyhead[CO]{\songti \wuhao 附录}
  \fancyhead[CE]{\songti \wuhao 东北林业大学本科毕业论文}
  \fancyfoot[CO, CE]{- \thepage\ -}
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
    \fancyhead[CO]{\songti \wuhao  结论}
    \fancyhead[CE]{\songti \wuhao 东北林业大学本科毕业论文}
    \fancyfoot[CO, CE]{- \thepage\ -}
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
\newcommand{\references}[1]{
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[CO]{\songti \wuhao  参考文献}
    \fancyhead[CE]{\songti \wuhao 东北林业大学本科毕业论文}
    \fancyfoot[CO, CE]{- \thepage\ -}
    \section*{参考文献}
    \renewcommand{\section}[2]{}
    \phantomsection\addcontentsline{toc}{section}{参考文献}%放进目录
    \songti \xiaosi
    \bibliographystyle{gbt7714-numerical} % 国标引用格式
    \bibliography{#1}
}

%参考文献(bibitem)
\newenvironment{biblist}{
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[CO]{\songti \wuhao  参考文献}
  \fancyhead[CE]{\songti \wuhao 东北林业大学本科毕业论文}
  \fancyfoot[CO, CE]{- \thepage\ -}
  \section*{参考文献}
  \renewcommand{\section}[2]{}
  \phantomsection\addcontentsline{toc}{section}{参考文献}%放进目录
  \bibliographystyle{gbt7714-numerical} % 国标引用格式
  \begin{thebibliography}{99}% 参考文献，{}内表示序号最大位数（两位）
}{
\end{thebibliography}
}

%========================================%
% 致谢环境
%========================================%
\newenvironment{acknowledgement}{
  \clearpage
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[CO]{\songti \wuhao  致谢}
    \fancyhead[CE]{\songti \wuhao 东北林业大学本科毕业论文}
    \fancyfoot[CO, CE]{- \thepage\ -}
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
      {\heiti \xiaoer 学位论文原创性声明\par}
    \endgroup
    \vspace{0.8cm}

    {\songti \sihao 
    本人郑重声明：所提交的毕业论文是本人在导师指导下独立进行研究工作所取得的成果。对本文的研究工作做出重要贡献的个人和集体，
    均已在文中以明确方式注明，其它未注明部分不包含他人已发表或撰写过的研究成果，不存在购买、由他人代写、剽窃和伪造数据等学术不端行为。

    本人愿为此声明承担法律责任.}
    \vspace{2.5cm}

    {\songti \sihao 
    作者签名：\quad\quad\quad\quad\quad\quad \quad\quad\quad 日期：\quad\quad\quad\quad 年 \quad\quad 月 \quad\quad 日}
    \vspace{1.5cm}

    \begingroup
      \centering
      {\heiti \xiaoer 学位论文版权授权书\par}
    \endgroup
    \vspace{0.8cm}

    {\songti \sihao 
    本学位论文作者同意授予东北林业大学对本论文全部内容的信息网络传播权、汇编权、发行权、转授权与复制权，具体包括但不限于将学位论文上传到有关数据库，
    影印、缩印或扫描等手段保存、查阅、借阅、汇编等.
    （保密的学位论文在解密后适用本授权书）\par}
    \vspace{2.5cm}

    {\songti \sihao 
    作者签名：\quad\quad\quad\quad\quad\quad \quad\quad\quad 日期：\quad\quad\quad\quad 年 \quad\quad 月 \quad\quad 日}

}