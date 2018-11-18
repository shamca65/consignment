#!/usr/bin/csh

setenv db jsbook

setenv PATH "/opt/informix/bin:$PATH"

echo "Dropping $db database..."

dbaccess - - <<!
drop database $db;
!
