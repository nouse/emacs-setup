#!/bin/sh

if [ ! -d "evil" ] ; then
  git clone git://gitorious.org/evil/evil.git
fi

if [ ! -d "markdown-mode" ] ; then
  git clone git://jblevins.org/git/markdown-mode.git
fi
