#!/bin/sh

if [ ! -d "evil" ] ; then
  git clone git://gitorious.org/evil/evil.git
fi

if [ ! -d "markdown-mode" ] ; then
  git clone git://jblevins.org/git/markdown-mode.git
fi

if [ ! -d "slim-mode" ] ; then
  git clone https://github.com/slim-template/emacs-slim slim-mode
fi

if [ ! -d "haskell-mode" ] ; then
  git clone https://github.com/haskell/haskell-mode.git
fi

if [ ! -d "ruby-electric" ] ; then
  git clone https://github.com/qoobaa/ruby-electric.git
fi

if [ ! -d "rinari" ] ; then
  git clone https://github.com/eschulte/rinari.git
fi

if [ ! -d "rhtml" ] ; then
  git clone https://github.com/eschulte/rhtml.git
fi

if [ ! -d "flymake-ruby" ] ; then
  git clone https://github.com/purcell/flymake-ruby.git
fi

if [ ! -d "flymake-easy" ] ; then
  git clone https://github.com/purcell/flymake-easy.git
fi

for repo in evil markdown-mode slim-mode haskell-mode rinari rhtml flymake-ruby flymake-easy
do
  cd $repo
  git pull
  cd ..
done
