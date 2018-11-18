#!/bin/csh -f

setenv db jsbook

setenv PATH "/opt/informix/bin:$PATH"

echo database name: $db

dbaccess $db - <<!
 
load from "lookup.unl" insert into lookup;
load from "contact.unl" insert into contact;

grant resource to public;

!
 
echo "Done."
