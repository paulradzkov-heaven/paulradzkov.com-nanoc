@echo off
set OLDDIR=%CD%
d:
cd \portablesoft\DeltaCopyRaw\
rsync -e 'D:\portablesoft\DeltaCopyRaw\ssh' --progress -lzugthvr --compress-level=9 --delete-after /Dropbox/nanoc/paulradzkov.com/output/ paulradzkov@paulradzkov.com:www/paulradzkov.com
chdir /d %OLDDIR%
