/*
** functions for handling database 
**
*/

// **************************************************************************

/*
** function dbConnect ()
**
** make a connection to the database
**
** Parameters:
**   None
**
** Globals:
**   project.app_name   - name of the current application
**   project.db_connect - connect string for the WIP database
**   project.db_name    - name of the WIP database
**   project.db_user    - database user for WIP database
**   project.db_pass    - database password for WIP database
**
** Locals:
**   None
**
** Returns:
**   None
**
*/

function dbConnect ()
{
   // connect to the database if not connected
   if (!database.connected ())
      database.connect ("INFORMIX", 
         project.db_connect, project.db_user, project.db_pass, project.db_name);

   // redirect error page if not able to connect
   if (! database.connected ())
      redirect ("apperr.html");
}

// **************************************************************************

/*
** function dbRelease ()
**
** disconnect from the database
**
** Parameters:
**   None
**
** Globals:
**   None
**
** Locals:
**   None
**
** Returns:
**   None
**
*/

function dbRelease ()
{
   if (database.connected ())
      database.disconnect ();
}

// **************************************************************************

/*
** function checkDBError ()
**
** check for a database error
**
** Parameters:
**   msg - additional message information
**
** Globals:
**   client.app_err - error received from database
**
** Locals:
**   None
**
** Returns:
**   None
**
*/

function checkDBError (msg)
{
   if (database.majorErrorCode() != 0)
   {
      client.app_err = (msg ? msg + "\n\n" : "")    +
                        database.majorErrorCode()    + ":" +
                        database.majorErrorMessage()
      redirect ("apperr.html");
   }
}

// **************************************************************************

/*
** function countRows (sql)
**
** count and return the number of rows in a table 
**
** Parameters:
**   sql - query sql statement
**
** Globals:
**   None
**
** Locals:
**   cursor - cursor to the database rows
**   count  - count of the number of rows retrieved from cursor
**
** Returns:
**   count  - count of the number of rows retrieved from cursor
**
*/

function countRows (sql)
{
   var cursor = database.cursor (sql);
   cursor.next();
   var count = cursor[0];
   cursor.close();
   return (count)
}

// **************************************************************************

/*
** function recordExists (sql)
**
** determine if a record exists by counting the rows retrieved from a query
**
** Parameters:
**   sql - query sql statement
**
** Globals:
**   None
**
** Locals:
**   cursor - cursor to the database rows
**   count  - count of the number of rows retrieved from cursor
**
** Returns:
**   count  - count of the number of rows retrieved from cursor
**
*/

function recordExists (sql)
{
   var cursor = database.cursor (sql);
   cursor.next();
   var count = cursor[0];
   cursor.close();
   return (count == 0 ? false : true)
}

// **************************************************************************

/*
** function dbShowSelect (name, def, sql)
**
** used to generate a selection list from a database query
**
** Parameters:
**   name - name of the select field
**   def  - default choice
**   sql  - sql to use to generate select list
**
** Globals:
**   None
**
** Locals:
**   cursor - database cursor used to retrieve rows
**
** Returns:
**   None
**
*/

function dbShowSelect (name, def, sql)
{
   var cursor = database.cursor (sql);
   writeln ('<select name="' + name + '">');
   while (cursor.next())
   {
      write ('<option value="' + cursor[0] + '"');
      write (cursor[0] == def ? " selected" : "");
      writeln ('>' + cursor[1]);
   }
   writeln ('</select>');
   cursor.close();
}

// **************************************************************************

function checkDBCode (code)
{
   if (code == 0)
      return;

   writeln ('<script>');
   writeln ('<!--- Hide script from old browsers.');
   writeln ('var msg = "An error occurred while saving your information!' +
            '\\n\\n' +
            database.majorErrorCode () + ' : ' +
            chop (database.majorErrorMessage ()) + '"');
   writeln ('alert (msg)');
   writeln ('// End the hiding here. -->');
   writeln ('</script>');
}

// **************************************************************************
 
/*
** function checkForNull (str)
**
** check for a null or empty string ... used to pass 'null' instead of ""
** to the database
**
** Parameters:
**   str - the string to check
**
** Globals:
**   None
**
** Locals:
**   None
**
** Returns:
**   the value 'null,' if the passed in string is empty or 'val', if not
**
**
*/
 
function checkForNull (str)
{
   if (str == "")
      return ('null,')
   else
      return ("'" + str + "',")
}
 

// **************************************************************************

function getMaxLen (table, field, min)
{
   var sql = "select max (length (" + field + ")) len from " + table;
   var cursor = database.cursor (sql);
   cursor.next ();
   var len = cursor.len;
   cursor.close ();
   return (len > min ? len : min);
}

// **************************************************************************

function getSerialFromInsert (sql)
{
   project.lock ();

   database.execute (sql);
   checkDBError (sql);

   sql = "select dbinfo('sqlca.sqlerrd1') from systables where tabid=1"
   var cursor = database.cursor (sql);
   cursor.next ();
   var id = cursor[0] + "";
   cursor.close ();

   project.unlock ();

   return (id);
}

// **************************************************************************
