
==============================
 西安电子科技大学学位论文模板
==============================

本项目提供了使用 XeLaTeX 排版西安电子科技大学各级学位（本科、硕士和博士）论文的模
板。目的是为习惯于使用 TeX 的毕业生能够更多的关注于论文的撰写与修改，提高毕业学位
论文内容的质量。

更新状态
========


已按照研究生院2014年研究生学位论文版式要求对模板进行了修改。

~~由于2014年学校对学校论文排版格式进行了较大幅度的修改，目前的论文模板格式不符合这一要
求。我将在未来一周进行一定的修改，期望能满足新的模板要求。~~ 

由于我目前工作非常忙，能用于修改模板的时间非常有限，因此非常欢迎有能力的同学把你
的修改发给我，我可以整合进这个模板。也不必是完整的修改，任何一个小部分的修改都非
常欢迎。

基本正确（待确认）格式包括：
----------------------------

- [X] 论文封面
- [X] 中文扉页
- [X] 英文扉页
- [X] 中文摘要
- [X] 中文关键词及论文类型
- [X] 英文摘要
- [X] 英文关键词及论文类型
- [X] 插图与表格索引
- [ ] 符号对照表（给出了可用示例）
- [ ] 缩略语对照表（给出了可用示例）
- [X] 页眉页脚
- 正文各级标题

  - [X] 一级标题（章）
  - [X] 二级标题（节）
  - [X] 一级标题（小节）
  - [X] 正文

- [ ] ~~作者简介（给出了简单示例）~~


安装说明
========

本模板开发和测试所使用的 TeX 发行版是 texlive ，其他比较新的 TeX 发行版也应该能够
正常工作。鉴于本模板在 texlive 上进行开发和完整测试，因此建议安装 texlive 2012或
更高版本环境使用。本模板是基于 ``XeLaTeX`` 和 ``xeCJK`` 宏包的，因此无论你使用哪
个 TeX 发行版，务必要安装 ``XeLaTeX`` 及 ``xeCJK`` 宏包。

安装本模板的过程非常简单，在 `https://github.com/fredqi/xduthesis/releases
<https://github.com/fredqi/xduthesis/releases>`_ 下载 ``*-relase.tar.gz`` 文件解
压，从中提取 ``examples`` 目录中的文件，按照你自己的需要进行修改即可。

如果希望从源代码自己进行安装，则需要下载 ``*-sources.tar.gz`` 文件，执行命令::

  xelatex xduthesis.ins

就会生成模板文件 ``xduthesis.cls`` 与 ``xduthesis.cfg`` 。这两个文件与
``xdu*.eps`` 文件一起，就构成了可以使用的模板宏包。你可以把这些文件放在
``<texmf-local>/tex/xelatex/xduthesis`` 目录下使用，也可以直接把它们放在你的论文
的 TeX 文件所在目录下。需要注意的是，选择将模板文件放在
``<texmf-local>/tex/xelatex/xduthesis`` 目录下时，需要在拷贝文件之后执行::

  mktexlsr

命令。


文件说明
========

模板中的各个文件功能如下：

- ``xduthesis.dtx`` 模板文件及说明文档
- ``xduthesis.ins`` 模板安装配置文件
- ``xdulogo.eps``   校徽
- ``xdubadge.eps``  本科学位论文使用的校名图案
- ``xdubadge-gr.eps``  研究生学位论文使用的校名图案
- ``version`` 模板版本号
- ``build.sh`` 用于生成本模板发文件的shell脚本

- ``examples`` 使用模板的示例文件，同时也是模板说明文件

    - ``thesis-bachelor.tex`` 本科学位论文主文档
    - ``thesis-master.tex`` 硕士学位论文主文档
	- ``thesis-masterpro.tex`` 专业硕士学位论文主文档
    - ``thesis-doctor.tex`` 博士学位论文主文档
    - ``abstract.tex`` 摘要
    - ``ch01-intro.tex`` 模板总体说明
    - ``ch02-options.tex`` 模板选项介绍
    - ``ch03-frontmatter.tex`` 论文前置部分使用说明
    - ``ch04-mainmatter.tex`` 论文主体部分使用说明
    - ``ch05-backmatter.tex`` 论文后置部分使用说明
    - ``ch06-bibliography.tex`` 参考文献排版指南
    - ``refs.bib`` BIBTeX格式的参考文献数据库
    - ``ch07-conclusions.tex`` 说明总结
    - ``appendix01.tex`` 论文附录部分排版示例
    - ``acknowledgments.tex`` 致谢示例
    - ``achievements.tex`` 在学期间成果
    - ``biography.tex`` 作者简介
    - ``photo.png`` 作者照片
    - ``SConstruct`` 用于自动编译论文的 scons 脚本

相关项目
========

本项目中部分排版代码参考了 `xdlinux <https://github.com/xdlinux>`_ 维护的西电本科
毕业设计论文模板 `xdba-thesis <https://github.com/xdlinux/xdba-thesis>`_ ，对此表示感谢。


其它
====

如果你使用这份模板为你节约了时间，希望你能够在学位论文的致谢部分提及。

Introduction
============

This is a XeLaTeX template for writing thesises to apply academic degrees in
Xidian University. The template is designed according to the official
requirements on typesetting thesises. The template currently supports all levels
of degrees from bachelor to docotor, including both academic master and
professional master. But it is not guaranteed that you will pass the typesetting
check and obtain your degree by using this template.

Copyright
=========

| xduthesis: XeLaTeX template for writing Xidian University Thesis
| Author: Fei Qi
| E-mail: fred.qi@ieee.org
| License: Released under the LaTeX Project Public License v1.3c or later
| See: http://www.latex-project.org/lppl.txt

Copyright (C) 2008-2016 by Fei Qi <fred.qi@ieee.org>

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License (LPPL), either
version 1.3c of this license or (at your option) any later
version.  The latest version of this license is in the file:

http://www.latex-project.org/lppl.txt

This work is "maintained" (as per LPPL maintenance status) by
Fei Qi.

This work consists of the file xduthesis.dtx and a Makefile.
Running "make" generates the derived files xduthesis.pdf and xduthesis.cls.
Running "make inst" installs the files in the user's TeX tree.
Running "make install" installs the files in the local TeX tree.
