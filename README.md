# Sphinx 中文 PDF

该 Docker 镜像用于从 Sphinx 文档生成含有中文的 PDF。

## 用法

将文档根目录（Makefile所在的目录）挂载到 ``/sphinx`` 上，运行 ``make latexpdf`` 即可。

```
docker run -it --rm -v $PWD:/sphinx init2/sphinx-cnpdf make latexpdf
```

``conf.py`` 中相关的配置：

```
latex_engine = 'xelatex'

latex_elements = {
    'papersize': 'a4paper',
    'utf8extra': '',
    'inputenc': '',
    'babel': '',
    'preamble': r'''
    \usepackage{xeCJK}
    \usepackage{indentfirst}
    \setlength{\parindent}{2em}
    # 镜像中只安装了 Noto Sans CJK 字体（https://www.google.com/get/noto/help/cjk/）
    # 如果需要其他字体，可以基于本镜像自行安装其他字体
    \setCJKmainfont{Noto Sans CJK SC}
    \setCJKmonofont{Noto Sans Mono CJK SC}
    \XeTeXlinebreaklocale "zh"
    \XeTeXlinebreakskip = 0pt plus 1pt
    ''',
}
```
