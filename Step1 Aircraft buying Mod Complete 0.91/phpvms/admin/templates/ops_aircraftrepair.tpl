<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html><head>
<meta content="text/html; charset=unicode" http-equiv=Content-Type>
<meta name=GENERATOR content="MSHTML 9.00.8112.16430">

</head>
<body>
<?php
// Variables here
$repdif= 100-"$aircraft->cond";
$repcost=("$aircraft->price"/ 100)*"$repdif";
?>

<h1><?php echo $aircraft->registration; ?> Repair Screen</h1>
<img src="/phpvms/admin/lib/images/hangar.png" height="340" width="550" alt="Hangar">
<br>
<br>
<br>
<br>
Current Condition: 
<?php
// Show the current Condition
echo $aircraft->cond;
?>
%
<br>
<br>
<br>
Current Time and Date:
<br>
<?php
// Show the current Date
print(date("Y.M.d"));
?>
<br>

<?php
$date = date("H:i");
// Show the current Time
print($date) ;
?>
h
<br>
<?php
//Repair Finished
echo $newtime;
?>

<br>
<br>
<table border=1 id="tabledlist" class="tablesorter">
<thead>
<tr>
    <th align="center" >To Repair</th>
    <th align="center">Repair Price</th>
    </tr>
</thead>
<tbody>
 <form action="<?php echo adminurl('/operations/aircraft');?>" method="post"> <tr>
    <td align="center"><?php echo $repdif ?>%</td>
    <td align="center"><?php echo number_format($repcost,2,",","."); echo Config::Get('MONEY_UNIT'); ?></td>
	<td <input type="hidden" name="id" value="<?php echo $aircraft->id;?>" />
	<input name="price" type="hidden" value="<?php echo $aircraft->price; ?>" />
	<input name="cond" type="hidden" value="100" />
	<input type="hidden" name="action" value="<?php echo $action;?>" />
	<input name="icao" type="hidden" value="<?php echo $aircraft->icao; ?>" />
	<input name="name" type="hidden" value="<?php echo $aircraft->name; ?>" />
	<input name="fullname" type="hidden"  value="<?php echo $aircraft->fullname; ?>" />
	<input name="registration" type="hidden"  value="<?php echo $aircraft->registration; ?>" />
	<input name="maxcargo" type="hidden"  value="<?php echo $aircraft->maxcargo; ?>" />
	<input name="downloadlink" type="hidden"  value="<?php echo $aircraft->downloadlink; ?>" />
	<input name="imagelink" type="hidden"  value="<?php echo $aircraft->imagelink; ?>" />
	<input name="maxpax" type="hidden"  value="<?php echo $aircraft->maxpax; ?>" />
	<input name="weight" type="hidden" value="<?php echo $aircraft->weight; ?>" />
	<input name="bought" type="hidden" value="<?php echo $aircraft->bought; ?>" />
	<input name="range" type="hidden"   value="<?php echo $aircraft->range; ?>" />
	<input name="cruise" type="hidden"  value="<?php echo $aircraft->cruise; ?>" />
	<input name="minrank" type="hidden"  value="<?php echo $aircraft->minrank; ?>" />
	<input type="hidden" name="id" value="<?php echo $aircraft->id;?>" />
	<input name="rep" type="hidden"  value="1" />
	<input type="hidden" id="enabled" name="0" />
	<input type="submit" name="submit" value="Repair" /></td>
  </tr></form>
</tbody>
</table>

<br>
<br>
<br>
<button class="{button:{icons:{primary:'ui-icon-wrench'}}}" 
      onclick="window.location='<?php echo adminurl('/operations/buysellaircraft?id='.$aircraft->id);?>';">==>Back<==</button>

</body>
</html>