#!/bin/sh

SETUP_PATH=$(dirname $0)

mkdir -p ~/.emacs.d/lisp

cp $SETUP_PATH/init.el ~/.emacs.d/init.el

emacs -Q --batch --script $SETUP_PATH/install-basic.el
emacs -Q --batch --script $SETUP_PATH/install-ruby-scripts.el
