Step 1 Aircraft buying Mod

It´s an early extension for PHPVMS to enhance the economic feeling. U can buy Aircrafts and Sell it... There are some more additons for my upcoming other mods. In the moment it is only for Passenger Flights.


IMPORTANT!!!!
Make an copy of following files first, before u install it!!!!!It´s only for Test in the moment.
- /phpvms/admin/templates/ops_aircraftform.tpl
- /phpvms/admin/templates/ops_aircraftlist.tpl

- and make an Backup from your database!!!
- when u add an aircraft, u must fill all fields !!!


Developed by:
Nighthawk
www.ts666-airways.de.vu

Developed on:
phpVMS v2.1.934-157-g7ca06a3 Beta !!!!
php 5.2.11
mysql 5.1.36
apache 2.2.11

Install 0.9:
============
-Update your PHPVMS to the latest Beta - That´s important to get this working!!!!!
-Download the attached package.
-unzip the package and place the files from folder ...complete as structured in your root phpVMS install. Overwrite the existing Files!!!!
-Run the SQL Batch File against your PHPVMSDB
-you must fill the fields cruise speed, pax, Range, max takeoff weight out without "," or "." on the Edit or Add Aircraft Page
-Add in your phpvms/core/app.config.php  where

# Constants for 'paysource' column in ledger
define('PAYSOURCE_PIREP', 1);

the line:
define('Payment', 2);

and add where 
# Constants for 'paytype' column in ledge
define('PILOT_PAY_HOURLY', 1);
define('PILOT_PAY_SCHEDULE', 2);
define('PILOT_PAY_FIXED', 3);

the line:
define('Payment', 4);

Update from 0.8 to 0.9
======================
-Update your PHPVMS to the latest Beta - That´s important to get this working!!!!!
-Download the attached package.
-unzip the package and place the files from folder ...update as structured in your root phpVMS install. Overwrite the existing Files!!!!
-Add in your phpvms/core/app.config.php  where

# Constants for 'paysource' column in ledger
define('PAYSOURCE_PIREP', 1);

the line:
define('Payment', 2);

and add where 
# Constants for 'paytype' column in ledge
define('PILOT_PAY_HOURLY', 1);
define('PILOT_PAY_SCHEDULE', 2);
define('PILOT_PAY_FIXED', 3);

the line:
define('Payment', 4);


Options:
=======
-For Manual Price input change in /phpvms/admin/templates/ops_buysellaircraft.tpl on line 58  "hidden" into "text"
<input name="price" type="hidden" value="<?php echo number_format((("$acprice1"*"$newrd")/100),2,",","."); ?>" />
<input name="price" type="text" value="<?php echo number_format((("$acprice1"*"$newrd")/100),2,",","."); ?>" />


Step1 Aircraft Buying Mod Released under the following license:
Creative Commons Attribution-Noncommercial-Share Alike 3.0 Unported License


Aircraft Buying Mod Current version:
================
0.91
----
- Added missing File ( Sorry !!!)


0.9
----
-Readme changed
--Making this mod independend from PHPVMS files...
-Simple Way to Lease an Aircraft implemented (Push Button To add expense ;-)
-Some Bugfixes


Known Bugs/ or must be fixed in 1.0:
====================================
-The price of an Aircraft wouldn´t added or substracted from the VA ToTal Money in the moment...
-the aircraft price calculation isn´t real in the moment, it´s only an example...
-The Check that the VA has enough Money to buy an aircraft not included yet
-When Repair Aircraft u must go to Db on the column rep and set 1 to 0 to finish the repair. Next release it will go by time...


 0.8
----
-Renamed ops_buysellaircraft.tpl to ops_aircraftbuysell.tpl  (!!!Please delete /phpvms/admin/templates/ops_buysellaircraft.tpl!!!)
-Added /phpvms/admin/templates/ops_aircraftrepair.tpl
-some bugfixes (when buy enable/ when sell disable aircraft etc.)
-Added some basic Features from Aircraft Repair Mod
-Leasing Aircraft

Known Bugs/ or must be fixed in 0.9:
====================================

-The price of an Aircraft wouldn´t added or substracted from the VA ToTal Money in the moment...
-the aircraft price calculation isn´t real in the moment, it´s only an example...
-The Check that the VA has enough Money to buy an aircraft not included yet
-When Repair Aircraft u must go to Db on the column rep and set 1 to 0 to finish the repair. Next release it will go by time...

History
=======

 0.7
----
-the first Release



Known Bugs/ or must be fixed 0.8:
=================================

-The price of an Aircraft wouldn´t added or substracted from the VA ToTal Money in the moment...
-the aircraft price calculation isn´t real in the moment, it´s only an example...
-Check that the VA has enough Money to buy an aircraft not included yet




please feel free to test and help it to get it running

My next mods will be:
- Step 2 Aircraft Repair Mod
- Step 3 Aircraft Maintenance Mod


Step1 Aircraft Buying Mod Released under the following license:
Creative Commons Attribution-Noncommercial-Share Alike 3.0 Unported License

Download: Version 0.8 (incl. update from 0.7) here=> http://www.ts666.de.vu/index.php?downloads-show-18