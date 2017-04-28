# Latex docker container

A docker container for building LaTeX documents. This image is based on the image provided by [blang/latex](https://hub.docker.com/r/blang/latex/) and provides additional functionality designed for automation and use as part of a continuous integration workflow.

If you need additional utilities not included in this package for your build, you can look at [flungo/latex-plus](https://hub.docker.com/r/flungo/latex-plus/) which adds a suite of tools on top of this image to improve usability.

## texmf

In order to support custom classes and styles, the ability to import a texmf environment from a URL has been added. The URL, defined with `TEXMF_URL` should point to an archive containing the contents of the texmf context required to build your project. This can be particularly useful for using this image within Continuous integration with company or University templates.

It is assumed that the archive given with `TEXMF_URL` is a compressed zip archive, but tar archives are also supported by setting `TEXMF_FORMAT=tar`. Options can be passed to the extraction command using `TEXMF_UNZIP_OPTS` and `TEXMF_TAR_OPTS` respective of which format you are using (for example, `TEXMF_TAR_OPTS=-z` if the archive is compressed with gzip).
