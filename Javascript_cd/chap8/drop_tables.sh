#!/usr/bin/csh

setenv db jsbook

setenv PATH "/opt/informix/bin:$PATH"

echo "Dropping $db tables..."

dbaccess $db - <<END

drop table contact;
drop table lookup;

END
