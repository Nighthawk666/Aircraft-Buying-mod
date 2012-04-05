<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html><head>
<meta content="text/html; charset=unicode" http-equiv=Content-Type>
<meta name=GENERATOR content="MSHTML 9.00.8112.16430">

</head>
<body>

<?php
	
// Here are the Calculations


// Condition for new Plane
$newrd= rand(95, 100);
// Price Calculation for new Plane
$acprice1="$aircraft->weight"*"$aircraft->maxpax"*("$aircraft->cruise"/100)*("$aircraft->range"*0.7 /"$aircraft->cruise");


// Condition for used Plane
$userd= rand(60, 85);
// Price Calculation for used Plane
$acprice2="$aircraft->weight"*"$aircraft->maxpax"*("$aircraft->cruise"/100)*("$aircraft->range"*0.7 /"$aircraft->cruise");

// Condition for retired Plane
$retrd= rand(25, 55);
// Price for retired Plane
$acprice3="$aircraft->weight"*"$aircraft->maxpax"*("$aircraft->cruise"/100)*("$aircraft->range"*0.7 /"$aircraft->cruise");

//Price for leasing Plane
$lease=(("$acprice1"*"$newrd")/100)/60;
$leasname="$aircraft->registration";
$leastype=M;
$leasev=FinanceData::AddExpense($leasname->post->name, $lease->post->cost, $leastype->post->type);
//Bought vars
$boughty= 1;
$lease= 2;

$sellrdm= rand(750, 950);
$sellprice= ("$aircraft->price"*"$sellrdm")/1000;

if($aircraft->bought ==0)

{

	// Show these if it is not bought or leased

?>
<h1><?php echo $aircraft->registration; ?> Buy Screen</h1>

<img src="<?php echo $aircraft->imagelink; ?>" height="140" width="140">
<br><br><br><br>
<table border=0 id="tabledlist" class="tablesorter">
<thead>
<tr>
    <th align="center">Status</th>
    <th align="center">Condition</th>
    <th align="center" >Price</th>
    <th align="center">Buy</th>
    </tr>
</thead>
<tbody>
 <form action="<?php echo adminurl('/Buysell/aircraft');?>" method="post"> <tr>
    <td align="center">New</td>
    <td align="center"><?php echo $newrd ?>%</td>
    <td align="center"><?php echo number_format((("$acprice1"*"$newrd")/100),2,",","."); echo Config::Get('MONEY_UNIT'); ?> </td>
    <td align="center"><input type="hidden" name="id" value="<?php echo $aircraft->id;?>" />
	<input name="price" type="text" value="<?php echo ((("$acprice1"*"$newrd")/100)); ?>"  />
	<input name="cond" type="hidden" value="<?php echo $newrd; ?>" />
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
	<input name="bought" type="hidden" value="<?php echo $boughty; ?>" />
	<input name="range" type="hidden"   value="<?php echo $aircraft->range; ?>" />
	<input name="cruise" type="hidden"  value="<?php echo $aircraft->cruise; ?>" />
	<input name="minrank" type="hidden"  value="<?php echo $aircraft->minrank; ?>" />
	<input type="hidden" id="enabled" name="enabled" value="1" />
	<input type="submit" name="submit" value="Buy" /></td>
    </form>
  </tr>
  <?php
  // Leasing 
  ?>
  
  <form action="<?php echo adminurl('/Buysell/aircraft'); ?>" method="post">
        
  <tr>
  <td align="center">Leasing</td>
  <td align="center"><?php echo $newrd ?>%</td>
  <td align="center"><?php echo number_format(((("$acprice1"*"$newrd")/100)/60),2,",","."); echo Config::Get('MONEY_UNIT'); ?> per Month </td>
  <td align="center"><input type="hidden" name="id" value="<?php echo $aircraft->id;?>" />
    <input name="price" type="text" value="<?php echo (((("$acprice1"*"$newrd")/100)/60)); ?>" />
  	<input name="cond" type="hidden" value="<?php echo $newrd; ?>" />
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
	<input name="bought" type="hidden" value="<?php echo $lease; ?>" />
	<input name="range" type="hidden"   value="<?php echo $aircraft->range; ?>" />
	<input name="cruise" type="hidden"  value="<?php echo $aircraft->cruise; ?>" />
	<input name="minrank" type="hidden"  value="<?php echo $aircraft->minrank; ?>" />
	<input name="financename" type="text" value="Leasing <?php echo $aircraft->registration; ?>" />
    <input name="cost" type="hidden" value="<?php echo $lease; ?>" />
	<input name="type" type="hidden" value="M" />
	<input type="hidden" id="enabled" name="enabled" value="1" />
    <input type="submit" name="submit" value="Lease" />
	
	</td>
	
	</form>
    </tr>
  </tbody>
</table>
For Leasing go 
<br>
<br>
<br>
<button class="{button:{icons:{primary:'ui-icon-wrench'}}}" 
      onclick="window.location='<?php echo adminurl('/Buysell/aircraft');?>';">==>Back<==</button>
	  
<button class="{button:{icons:{primary:'ui-icon-wrench'}}}" 
      onclick="window.location='<?php echo adminurl('/finance/addexpense');?>';">==>Add Expense<==</button>	  
<?php

}

else

{

	// Show these if it is bought

?>
<h1><?php echo $aircraft->registration; ?> Options Screen</h1>

<img src="<?php echo $aircraft->imagelink; ?>" height="140" width="140">
<br><br><br><br>
<h3><?php echo $aircraft->registration; ?> Current Aircraft</h2>
Aircraft Name: 
<?php
// Show the current Condition
echo $aircraft->fullname;
?>
<br>
Registration: 
<?php
// Show the current Condition
echo $aircraft->registration;
?>
<br>
Max Range: 
<?php
// Show the current Condition
echo $aircraft->range;
echo Config::Get('UNITS'); 
?>
<br>
Weight: 
<?php
// Show the current Condition
echo $aircraft->weight;
echo Config::Get('CARGO_UNITS'); 
?>

<br>
Cruising Speed: 
<?php
// Show the current Condition
echo $aircraft->cruise;
?>
kts
<br>
Max Passengers: 
<?php
// Show the current Condition
echo $aircraft->maxpax;
?>
<br>
Minimum Rank: 
<?php
// Show the current Condition
echo $aircraft->ranklevel;
?>
<br>
Buying Price: 
<?php
// Show the current Condition
echo number_format($aircraft->price,2,",","."); echo Config::Get('MONEY_UNIT'); 
?>
<br>
Condition: 
<?php
// Show the current Condition
echo $aircraft->cond;
?>
%
<br>
Va Money: 
<?php
// Show the current Condition
$Vas = FinanceData::calculateFinances($month_info);
foreach($Vas as $Va)
{echo "{$month_info->revenue}";}
?>
<br>
<br>
<?php
// Enable Button is now here
?>
<form action="<?php echo adminurl('/Buysell/aircraft');?>" method="post">

<dt>Enabled?</dt>
<?php $checked = ($aircraft->enabled==1 || !$aircraft)?'checked':''; ?>
<input type="checkbox" id="enabled" name="enabled" value="1" <?php echo $checked ?> />

	<input name="price" type="hidden" value="<?php echo $aircraft->price; ?>" />
	<input name="cond" type="hidden" value="<?php echo $aircraft->cond; ?>" />
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
	<input type="submit" name="submit" value="Enable" /></td>
 </form>
<br>
<?php
// Sell Function is here
?>
<?php
if ($aircraft->bought ==1)
{
?>

<br>
 <form action="<?php echo adminurl('/Buysell/aircraft');?>" method="post"> 
   
	<input name="price" type="hidden" value="0" />
	<input name="cond" type="hidden" value="0" />
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
	<input name="bought" type="hidden" value="0" />
	<input name="range" type="hidden"   value="<?php echo $aircraft->range; ?>" />
	<input name="cruise" type="hidden"  value="<?php echo $aircraft->cruise; ?>" />
	<input name="minrank" type="hidden"  value="<?php echo $aircraft->minrank; ?>" />
	<input type="hidden" name="id" value="<?php echo $aircraft->id;?>" />
	<?php $checked = ($aircraft->enabled==1 || !$aircraft)?'CHECKED':''; ?>
	<input type="hidden" id="enabled" name="enabled" value="0" />
	<input type="submit" name="submit" value="Sell" /></td>
 </form>
 <br>	  
<strong>Sellprice: <?php echo number_format($sellprice,2,",","."); echo Config::Get('MONEY_UNIT'); ?></strong>
<?php
}
?>
<?php
// Unlease Function is here
?>
<?php
if ($aircraft->bought ==2)
{
?>

<br>
 <form action="<?php echo adminurl('/Buysell/aircraft');?>" method="post"> 
   
	<input name="price" type="hidden" value="0" />
	<input name="cond" type="hidden" value="0" />
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
	<input name="bought" type="hidden" value="0" />
	<input name="range" type="hidden"   value="<?php echo $aircraft->range; ?>" />
	<input name="cruise" type="hidden"  value="<?php echo $aircraft->cruise; ?>" />
	<input name="minrank" type="hidden"  value="<?php echo $aircraft->minrank; ?>" />
	<input type="hidden" name="id" value="<?php echo $aircraft->id;?>" />
	<?php $checked = ($aircraft->enabled==1 || !$aircraft)?'CHECKED':''; ?>
	<input type="hidden" id="enabled" name="enabled" value="0" />
	<input type="submit" name="submit" value="Unlease" /></td>
 </form>
 <br>	  
<?php
}
?>
<br>
<br>
<?php
if($aircraft->cond <=99)
{
?>
<button class="{button:{icons:{primary:'ui-icon-wrench'}}}" 
      onclick="window.location='<?php echo adminurl('/Buysell/repairaircraft?id='.$aircraft->id);?>';">Repair</button> 
<?php
}
else

{echo "Full repaired";}

?>	  
<br>	  
 <br>
<br>
<br>
<button class="{button:{icons:{primary:'ui-icon-wrench'}}}" 
      onclick="window.location='<?php echo adminurl('/Buysell/aircraft');?>';">==>Back<==</button>	
  
<?php

}

?>

</body>