#!/usr/bin/csh

setenv db jsbook

setenv PATH "/opt/informix/bin:$PATH"

echo "Creating $db database..."

dbaccess - - <<!
create database $db with log;
!

dbaccess $db - <<END

grant resource to public;

END
