#!/bin/sh
basepath=$(cd `dirname $0`; pwd)
ln -s  ${basepath}/vimrc ~/.vimrc
ln -s ${basepath}/vim ~/.vim 
