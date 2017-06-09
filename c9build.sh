#!/bin/bash

mkdir -p $HOME/bin
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux-dev.tgz | tar -zxvf- -C $HOME/bin
testspace config url http://21a2b85afb9b6370c8c15144cad577fa72cf7b78:@s2.stridespace.com/s2technologies:testspace.test.ci
testspace -v

printenv > printenv.txt

testspace results.xml printenv.txt "standalone#c9.build"