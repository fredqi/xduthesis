#!/usr/bin/env bash
## ----------------------------------------------------------------------
## START OF FILE
## ----------------------------------------------------------------------
## 
## Filename: build.sh
## Author: Fred Qi
## Created: 2011-03-14 18:00:29(+0800)
## 
## ----------------------------------------------------------------------
### CHANGE LOG
## ----------------------------------------------------------------------
## Last-Updated: 2013-03-13 17:04:00(+0800) [by Fred Qi]
##     Update #: 43
## ----------------------------------------------------------------------

pkg=xdthesis
ver="$(cat version)"
zball="$pkg-$ver-source.tar.gz"
rball="$pkg-$ver-release.tar.gz"

rm $pkg.{cls,cfg}

## ----------------------------------------------------------------------
## Generate XeLaTeX class files
## ----------------------------------------------------------------------
xelatex $pkg.ins

## ----------------------------------------------------------------------
## Generate the user guide
## ----------------------------------------------------------------------
xelatex $pkg.dtx
makeindex -s gind.ist $pkg.idx
makeindex -s gglo.ist -o $pkg.gls $pkg.glo
xelatex $pkg.dtx
xelatex $pkg.dtx

cd examples
scons -c && scons
cd ..

## ----------------------------------------------------------------------
## Generate the release package
## ----------------------------------------------------------------------
[[ -f $zball ]] && rm $zball

tar chzvf $zball $pkg.{pdf,dtx,ins} examples/$pkg.{cfg,cls} \
    examples/{thesis-*,biography,a*,ch*}.tex \
    examples/photo.png examples/refs.bib \
    examples/xd*.eps \
    examples/SConstruct

[[ -f $rball ]] && rm $rball

tar chzvf $rball $pkg.{cfg,cls} xd*.eps

## ----------------------------------------------------------------------
### END OF FILE 
## ----------------------------------------------------------------------
