# 东北林业大学毕业论文LaTeX模板(个人优化版)

此模板是基于东北林业大学理学院李雨老师的毕业论文LaTeX模板, 本人对模板进行了样式的封装以及使用方法的简化.

## 1. 模板使用说明
模板包含`nefuthesis.cls`,`template.tex`和 `references.bib`三个文件, 以及`sections`和`pictures`两个文件夹. `pictures`文件夹中包含封面使用的logo图片, 请勿删除!

`nefuthesis.cls`文件是论文模板的样式文件, 在`template.tex`文件中, 使用如下命令应用模板样式:
```
\documentclass{nefuthesis}
```

## 2. 模板相关命令
东林的毕业论文结构包含: 封面, 中英文摘要, 正文, 结论, 附录, 参考文献,
致谢以及声明. 每个部分在模板内都提供了相应的命令和环境.

### 2.1 封面
论文封面包含: 论文标题, 论文作者, 指导老师, 专业班级, 学院, 学号等信息, 
分别对应如下命令:
```
\title{论文标题}
\author{论文作者}
\supervisor{指导老师}{指导老师职称}
\degreeinfo{本科毕业论文} % 本科毕业论文 or 硕士毕业论文
\college{学院}
\major{专业}{班级}
\studentid{学号}
\date{2024年6月}
```
上述信息填写完毕, 使用`\makecover`添加封面
```
\begin{document}
    % 填写信息
    \title{论文标题}
    \author{论文作者}
    \supervisor{指导老师}{指导老师职称}
    \degreeinfo{本科毕业论文} % 本科毕业论文 or 硕士毕业论文
    \college{学院}
    \major{专业}{班级}
    \studentid{学号}
    \date{2024年6月}

    % 显示封面
    \makecover
\end{document}

```

### 2.2 摘要
模板内提供了`abstract`环境用于生成中英文摘要, 其中`abstract`环境有三个参数:
```
\begin{abstract}[参数1][参数2]{关键词列表}
    % 参数1: 用于设置中英文摘要环境, 默认值是cn
    %   cn -> 表示中文摘要
    %   en -> 表示英文摘要
    % 参数2: 用于设置摘要的页码, 默认值是1
    %   1 -> 中文摘要使用1
    %   2 -> 英文摘要使用2
    % 关键词列表: 用于显示论文的关键词
    %   中文请使用；分隔关键词, 英文请使用;\sep分割关键词
\end{abstract}
```
中文摘要示例:
```
\begin{abstract}[cn][1]{关键词1；关键词2；关键词3}
    中文摘要内容
\end{abstract}
```
英文摘要示例:
```
\begin{abstract}[en][2]{keyword1;\sep keyword2;\sep keyword3}
    The content of English abstract.
\end{abstract}
```

### 2.3 目录
使用`\content`命令生成论文的目录


### 2.4 正文
论文正文的全部内容必须在`thesis`环境内编写
```
\begin{thesis}
    \section{一级标题}
    \subsection{二级标题}
    \subsubsection{三级标题}
\end{thesis}
```

### 2.5 附录
附录环境`Appendix`
```
\begin{Appendix}
    附录内容
\end{Appendix}
```

### 2.6 结论
结论环境`conclusion`
```
\begin{conclusion}
    结论内容
\end{conclusion}
```

### 2.7 参考文献
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
### 2.8 致谢
致谢环境`acknowledgement`
```
\begin{acknowledgement}
    致谢内容
\end{acknowledgement}
```

## 3. 模板使用建议

### 3.1 正文内容
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

### 3.2 论文图片
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
## 4. 注意事项
模板中的参考文献的样式为国标引用格式, 但是`\references`命令和`biblist`环境生成的参考文献列表会有些样式上的差别, 产生这种现象的原因在于`biblist`环境中的每个参考文献样式是由自己指定的, 而`\references`命令则是通过`gbt7714`宏包自动生成的样式. 如果一些学院对于参考文献存在特定的样式要求, 建议使用`biblist`环境生成参考文献.