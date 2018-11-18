#!/usr/bin/csh

setenv db jsbook

setenv PATH "/opt/informix/bin:$PATH"

echo "Creating $db tables..."

dbaccess $db - <<END

create table contact
(
   id         serial,
   fname      varchar (20,1) not null,
   lname      varchar (20,1) not null,
   street     varchar (80,1),
   city       varchar (40,1),
   state      varchar (2,1),
   zipcode    varchar (10,1),
   homephone  varchar (20,1),
   workphone  varchar (20,1),
   notes      char (2048),
   lastupdate datetime year to second not null
);

create table lookup
(
   type    varchar (10) not null,
   code    varchar (20) not null,
   value   varchar (80) not null
);

grant resource to public;

END
