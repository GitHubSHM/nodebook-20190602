#!/bin/sh

BASE_DIR=/usr/local/nginx  #基础路径
BASE_FILE_NAME=bhz.com.access.log   #日志文件名

CURRENT_PATH=$BASE_DIR/logs    #日志所在文件夹
BAK_PATH=$BASE_DIR/datalogs    #日志备份文件夹

CURRENT_FILE=$CURRENT_PATH/$BASE_FILE_NAME     #日志全路径
BAK_TIME=`/bin/date -d yesterday +%Y%m%d%H%M`  #时间格式，用来区分日志文件备份时间
BAK_FILE=$BAK_PATH/$BAK_TIME-$BASE_FILE_NAME   #备份日志文件全路径
echo $BAK_FILE  #输出备份日志的全路径

$BASE_DIR/sbin/nginx -s stop   #首先关闭nginx服务器

mv $CURRENT_FILE $BAK_FILE   #备份日志，将源文件移动至备份中，产生一个新文件

$BASE_DIR/sbin/nginx   #最后启动nginx


