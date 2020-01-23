#!/bin/bash

find /home/yoo/sinox -type d -print0 | xargs -0 \
	chmod -R --reference=$1 $2





