#1修改上传文件大小
打开php.ini（用locate查找，一般在/etc/php5/apache2）
修改upload_max_filesize = 100M
然后重启apache2服务，sudo service apache2 restart
