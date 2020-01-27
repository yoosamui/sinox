#!/bin/bash

find /home/yoo/sinox -type f -print0 | xargs -0 \
	chmod -R --reference=$1 $2





