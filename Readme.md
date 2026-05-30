# 东北林业大学硕士学位论文 LaTeX 模板（个人优化版）

此模板基于东北林业大学理学院李雨老师的毕业论文 LaTeX 模板，本人对模板进行了样式的封装以及使用方法的简化。

## 1. 模板文件说明

| 文件/文件夹 | 说明 |
|:---|:---|
| `nefuthesis.cls` | 论文模板样式文件（核心文件） |
| `main.tex` | 论文主文件，在此编写论文 |
| `references.bib` | BibTeX 参考文献数据库 |
| `gbt7714-unsrt-no-uppercase.bst` | 国标参考文献格式文件 |
| `sections/` | 存放各章节 `.tex` 文件 |
| `pictures/` | 存放图片，含封面 logo（请勿删除！） |

在 `main.tex` 中使用如下命令应用模板样式：
```latex
\documentclass{nefuthesis}
```

**编译方式**：`xelatex → bibtex → xelatex → xelatex`

---

## 2. 封面信息命令

在 `\begin{document}` 之前设置以下信息，然后使用 `\makecover` 生成中英文封面。

| 命令 | 参数说明 | 示例 |
|:---|:---|:---|
| `\title{中文}{英文}` | 中英文论文标题 | `\title{论文标题}{Paper Title}` |
| `\author{中文}{英文}` | 中英文作者姓名 | `\author{张三}{Zhang San}` |
| `\studentid{学号}` | 学号 | `\studentid{2023113155}` |
| `\supervisor{中文名}{中文职称}{英文名}{英文职称}` | 指导老师信息（4个参数） | `\supervisor{李四}{教授}{Li Si}{Professor}` |
| `\degree{中文}{英文}` | 学位级别，默认硕士/Master | `\degree{硕士}{Master}` |
| `\specialty{中文}{英文}` | 学科专业 | `\specialty{数学}{Mathematics}` |
| `\subdate{日期}` | 论文提交日期 | `\subdate{2026年3月}` |
| `\defensedate{中文日期}{英文日期}` | 论文答辩日期（**2个参数**） | `\defensedate{2026年6月}{June, 2026}` |
| `\schoolcode{代码}` | 学校代码，默认 10225 | `\schoolcode{10225}` |
| `\grantdate{日期}` | 授予学位日期 | `\grantdate{2026年6月}` |
| `\chairman{姓名}` | 答辩委员会主席 | `\chairman{王五}` |
| `\reviewer{姓名}` | 论文评阅人 | `\reviewer{赵六}` |
| `\university{中文}{英文}` | 授予学位单位，默认东北林业大学 | 一般无需修改 |

### 生成封面
```latex
\begin{document}
    \makecover
\end{document}
```

---

## 3. 摘要环境

使用 `abstract` 环境生成中英文摘要，该环境有 **2 个可选参数** 和 **1 个必选参数**：

```latex
\begin{abstract}[语言][页码]{关键词列表}
    摘要正文...
\end{abstract}
```

| 参数 | 说明 | 可选值 |
|:---|:---|:---|
| 参数1（可选） | 语言选项，默认 `cn` | `cn`（中文）/ `en`（英文） |
| 参数2（可选） | 起始页码，默认 `1` | 中文摘要用 `1`，英文摘要用 `2` |
| 参数3（必选） | 关键词列表 | 中文用 `；` 分隔，英文用 `; \sep` 分隔 |

**中文摘要示例：**
```latex
\begin{abstract}[cn][1]{关键词1；关键词2；关键词3}
    中文摘要内容（约300字）...
\end{abstract}
```

**英文摘要示例：**
```latex
\begin{abstract}[en][2]{keyword1;\sep keyword2;\sep keyword3}
    The content of English abstract...
\end{abstract}
```

---

## 4. 目录

使用 `\content` 命令自动生成论文目录：

```latex
\content
```

---

## 5. 正文环境

论文正文的全部内容必须在 `thesis` 环境内编写，支持三级标题：

```latex
\begin{thesis}
    \section{一级标题（章）}
    \subsection{二级标题（节）}
    \subsubsection{三级标题（小节）}
\end{thesis}
```

建议将各章节分别放在 `sections/` 文件夹中，通过 `\input` 引入：
```latex
\begin{thesis}
    \input{sections/chapter1.tex}
    \input{sections/chapter2.tex}
    \input{sections/chapter3.tex}
\end{thesis}
```

---

## 6. 定理类环境

模板预定义了以下定理环境（按章节编号，如定理 1.1、定义 2.1 等）：

| 环境 | 用途 | 用法 |
|:---|:---|:---|
| `theorem` | 定理 | `\begin{theorem}...\end{theorem}` |
| `definition` | 定义 | `\begin{definition}...\end{definition}` |
| `lemma` | 引理 | `\begin{lemma}...\end{lemma}` |
| `example` | 例 | `\begin{example}...\end{example}` |
| `deduction` | 推论 | `\begin{deduction}...\end{deduction}` |
| `proposition` | 命题 | `\begin{proposition}...\end{proposition}` |
| `property` | 性质 | `\begin{property}...\end{property}` |
| `remark` | 注释 | `\begin{remark}...\end{remark}` |
| `proof` | 证明环境 | `\begin{proof}[可选标题]...\end{proof}` |
| `solve` | 解环境 | `\begin{solve}[可选标题]...\end{solve}` |

---

## 7. 引用命令

| 命令 | 说明 |
|:---|:---|
| `\cite{引用键}` | 正文引用（国标格式，如 `[1]`） |
| `\citeup{引用键}` | 上标引用（如 `¹`） |

公式、图表按章节编号（格式：`章-序号`），使用 `\label` 和 `\ref` 交叉引用。

---

## 8. 其他环境

### 8.1 附录
```latex
\begin{Appendix}
    附录内容...
\end{Appendix}
```

### 8.2 结论
```latex
\begin{conclusion}
    结论内容...
\end{conclusion}
```

### 8.3 参考文献
```latex
\references{references}  % 引用 references.bib 文件（不含 .bib 后缀）
```

### 8.4 攻读学位期间发表的学术论文
```latex
\begin{published}
    发表的论文列表...
\end{published}
```

### 8.5 致谢
```latex
\begin{acknowledgement}
    致谢内容...
\end{acknowledgement}
```

### 8.6 原创性声明与版权授权书
```latex
\declaration
```

---

## 9. 字号命令

模板预定义了从大到小的中文字号命令：

| 命令 | 对应字号 | 大小 |
|:---|:---|:---|
| `\yihao` | 一号 | 26pt |
| `\xiaoyi` | 小一 | 24pt |
| `\erhao` | 二号 | 22pt |
| `\xiaoer` | 小二 | 18pt |
| `\sanhao` | 三号 | 16pt |
| `\xiaosan` | 小三 | 15pt |
| `\sihao` | 四号 | 14pt |
| `\xiaosi` | 小四 | 12pt |
| `\wuhao` | 五号 | 10.5pt |
| `\xiaowu` | 小五 | 9pt |
| `\liuhao` | 六号 | 7.5pt |

---

## 10. 辅助命令

| 命令 | 说明 | 示例 |
|:---|:---|:---|
| `\cnspacing{文字}` | 给中文字符间添加间距（用于封面） | `\cnspacing{数学}` |
| `\sep` | 英文关键词分隔符 | `keyword1;\sep keyword2` |

---

## 11. 完整论文结构

论文的推荐结构如下：

```
\makecover                    % 封面
\begin{abstract}[cn][1]{...}  % 中文摘要
\end{abstract}
\begin{abstract}[en][2]{...}  % 英文摘要
\end{abstract}
\content                      % 目录
\begin{thesis}                % 正文
    \section{...}
    ...
\end{thesis}
\begin{Appendix}              % 附录
    ...
\end{Appendix}
\begin{conclusion}            % 结论
    ...
\end{conclusion}
\references{references}       % 参考文献
\begin{published}             % 发表论文（可选）
    ...
\end{published}
\begin{acknowledgement}       % 致谢
    ...
\end{acknowledgement}
\declaration                  % 声明

\begin{conclusion}            % 结论内容
    ...
\end{conclusion}
```

### 12. 参考文献
模板内对于参考文献提供了`\references`命令和`biblist`环境两种不同的文献设置样式

对于使用文献管理器的同学, 可以通过文献管理器将论文中的参考文献导出为bibtex文件, 然后使用命令`\references{references.bib}`即可显示参考文献列表

对于不使用文献管理器的同学, 可以在`biblist`环境中部填写论文中的参考文献
```
\begin{biblist}
    \bibitem ...
    \bibitem ...
    \bibitem ...
\end{biblist}
```
### 13. 致谢
致谢环境`acknowledgement`
```
\begin{acknowledgement}
    致谢内容
\end{acknowledgement}
```

## 14. 模板使用建议

### 14.1 正文内容
论文正文的编写, 建议在`sections`文件夹下按照章节分文件进行编写:
```
--sections
    |--chapter 1.tex
    |--chapter 2.tex
    ...
    |--chapter n.tex
```
然后在`thesis`环境中使用`\input`命令引用内容:
```
\begin{thesis}
    \input{sections/chapter 1.tex}
    \input{sections/chapter 2.tex}
    ...
    \input{sections/chapter n.tex}
\end{thesis}
```
这样的编写方式能够让使用者有条理地管理论文的内容, 并且当论文编译出错时, 也方便查找错误.

### 14.2 论文图片
论文中使用的图片, 同样建议按照章节放在`pictures`文件夹下同一管理:
```
--pictures
    |--chapter 1
        |--figure.png
    |--chapter 2
        |--figure.png
    ...
    |--chapter n
        |--figure.png
```
## 15. 注意事项
模板中的参考文献的样式为国标引用格式, 但是`\references`命令和`biblist`环境生成的参考文献列表会有些样式上的差别, 产生这种现象的原因在于`biblist`环境中的每个参考文献样式是由自己指定的, 而`\references`命令则是通过`gbt7714`宏包自动生成的样式. 如果一些学院对于参考文献存在特定的样式要求, 建议使用`biblist`环境生成参考文献.