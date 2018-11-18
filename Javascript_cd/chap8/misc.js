/*
** miscellaneous routines
**
*/

// **************************************************************************

/*
** function appInit ()
**
** initialize some application parameters from .ini file
**
** Parameters:
**   None
**
** Globals:
**   project.app_name       - name of the current application
**   project.prod_db_name   - name of the production database
**   project.db_connect     - connect string for the WIP database
**   project.db_name        - name of the WIP database
**   project.db_user        - database user for WIP database
**   project.db_pass        - database password for WIP database
**
** Locals:
**   ini_file - name of the startup file
**   msg      - message to show in popup box
**   line     - line of data from ini file
**   val      - value of the property from data line
**   prop     - name of the property from the data line
**
** Returns:
**   None
**
*/

function appInit ()
{
   var ini_file = new File ("/home/mcnair/livewire/contact/contact.ini");

   project.lock();
   if (! ini_file.open ("r"))
   {
      client.app_err = "Cannot open .ini file!";
      redirect ("apperr.html");
   }
   else
   {
      while (! ini_file.eof())
      {
         var line = ini_file.readln();
         if (line.charAt (0) == "#" || line == "" || line == null)
            continue
         var vals = new split (line, "=", 2);
         var prop = vals[0].toLowerCase();
         var val  = (vals[1] != null ? vals[1] : "")
         project[prop] = val;
      }
      ini_file.close();
   }
   project.unlock();
}



/*
** function writeln (text)
**
** writes some text with a newline character
**
** Parameters:
**   text - the text to write out
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

function writeln (text)
{
   write (text + '\n');
}

// **************************************************************************

/*
** function chop (str)
**
** chop the last character off a string
**
** Parameters:
**   str - the string to chop
**
** Globals:
**   None
**
** Locals:
**   None
**
** Returns:
**   the chopped string
**
*/

function chop (str)
{
   return (str.substring (0, str.length - 1))
}

// **************************************************************************

/*
** function trim (str)
**
** trims whitespace from a string
**
** Parameters:
**   str - the string to trim
**
** Globals:
**   None
**
** Locals:
**   i - loop variable
**
** Returns:
**   the trimmed string
**
*/

function trim (str)
{
   // if empty string, return unchanged
   if (str == "") return (str);

   // else trim whitespace from end of string
   for (var i = str.length - 1; i >= 0; i--)
      if (str.charAt (i) != " ")
         return (str.substring (0, i + 1));

   // return the trimmed string
   return (str);
}

// **************************************************************************

/*
** function split (str, ch, n)
**
** creates an array of elements by splitting a string at each occurance of
** the specified character
**
** Parameters:
**   str - the string to split
**   ch  - the delimiter character
**
** Globals:
**   None
**
** Locals:
**   i     - array index
**   idx   - character index in string
**   start - starting index for search in string
**
** Returns:
**   this - array of elements created
**
*/

function split (str, ch, n)
{
   // initialize variables
   var i     = 0;
   var idx   = 0;
   var start = 0;

   n = (isNum (n) ? n : 999999)

   // loop through entire string
   while (start < str.length)
   {
      // find the index of the delimiter character starting from
      // previous position
      idx = str.indexOf (ch, start);

      // quit if there are no more occurances of character
      if (idx == -1) break; 

      // quit if we have enough elements
      if (i == n) break;

      // add string to element array
      this[i++] = str.substring (start, idx);

      // new starting point will be one more position from current
      start = idx + 1;
   }

   // if any data still remains, add it to element array as item
   if (str.substring (start, str.length) != "")
      this[i++] = str.substring (start, str.length);

   // set the length of the array and return it
   this.length = i;
   return (this);
}

// **************************************************************************

/*
** function clientAlert (msg)
**
** show an alert message
**
** Parameters:
**   msg - message to show in alert box
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

function clientAlert (msg)
{
   writeln ('<script>');
   writeln ('alert (\'' + msg + '\')');
   writeln ('</script>');
}

// **************************************************************************

/*
** function replaceChar (str, ch1, ch2)
**
** replace all characters matching ch1 in str with ch2
**
** Parameters:
**   str - string to replace character in
**   ch1 - character to replace
**   ch2 - character to replace with
**
** Globals:
**   None
**
** Locals:
**   tstr - the updated string
**   i    - loop variable
**   c    - current character in string
**
** Returns:
**   tstr - the updated string
**
*/

function replaceChar (str, ch1, ch2)
{
   var c;
   var tstr = "";

   // if empty string or no ch1 characters, return unchanged
   if (str == "" || str.indexOf(ch1) < 0)
      return (str);

   // loop through and replace characters
   for (var i = 0; i < str.length; i++)
   {
      c = str.charAt(i);
      if (c != ch1)
         tstr += c;
      else
         tstr += ch2;
   }

    // return the new string
   return (tstr);
}

// **************************************************************************

/*
** function isNum (num)
**
** check to see if the value passed in is a number
**
** Parameters:
**   num - the value passed in
**
** Globals:
**   None
**
** Locals:
**   None
**
** Returns:
**   false - if not a number
**   true  - if a number
**
*/

function isNum (num)
{
   if ((parseInt (num) + "") == "NaN")
      return (false);
   return (true);
}

// **************************************************************************

function pad (str, len)
{
   if (str == null) str = "";
   while (str.length <= len)
   {
      str += " ";
   }
   return (str);
}
 
// **************************************************************************


/*
** function getTodaysTimeStamp ()
**
** returns a timestamp formatted for a string
**
** Parameters:
**   None
**
** Globals:
**   None
**
** Locals:
**   d    - current date object
**   date - string representation of a timestamp
**
** Returns:
**   date - string representation of a timestamp
**
*/

function getTodaysTimeStamp ()
{
   var d = new Date ();
   var date  = d.getYear()  + "-" + (d.getMonth()+1) + "-" + d.getDate() + " ";
       date += d.getHours() + ":" + d.getMinutes()   + ":" + d.getSeconds();
   return (date);
}

// **************************************************************************
