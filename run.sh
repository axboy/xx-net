#!/bin/bash

# cur dir
BASE=$(cd `dirname $0`; pwd)

# 最后要执行的shell
CMD="xx-net.sh"

if [ ! -f "$BASE/$CMD" ]; then
	# 第一次运行，文件xx-net文件不存在，则执行./start
	CMD="start"
else
	if [ ! -x  "$BASE/$CMD" ]; then
		# 判断是否有执行权，没有则加上
		chmod +x $BASE/$CMD
	fi
fi
# 运行
$BASE/$CMD start