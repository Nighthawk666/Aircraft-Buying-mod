<h3>Aircraft List</h3>
<p>These are all the aircraft that your airline operates.</p>
<?php
if(!$allaircraft)
{
	echo '<p id="error">No aircraft have been added</p>';
	return;
}
?>
<table id="tabledlist" class="tablesorter">
<thead>
<tr>
    <th align="center">ICAO</th>
    <th align="center">Name/Type</th>
    <th align="center" >Full Name</th>
    <th align="center">Registration</th>
    <th align="center">Max Pax</th>
    <th align="center">Max Cargo</th>
    <th align="center">Condition</th>
    <th align="center">Price</th>
    <th align="center">Buy/Sell</th>
    <th>Options</th>
</tr>
</thead>
<tbody>
<?php
foreach($allaircraft as $aircraft)
{
?>
<tr class="<?php echo ($aircraft->enabled==0)?'disabled':''?>">
    <td align=center><?php echo $aircraft->icao; ?></td>
    <td align=center><?php echo $aircraft->name; ?></td>
    <td align=center><?php echo $aircraft->fullname; ?></td>
    <td align=center><?php echo $aircraft->registration; ?></td>
    <td align=center><?php echo $aircraft->maxpax; ?></td>
    <td align=center><?php echo $aircraft->maxcargo; ?></td>
    <td align=center><?php echo $aircraft->cond; ?>%</td>
<?php if($aircraft->bought ==2)
    {?><td align=center><?php echo number_format($aircraft->price,2,",","."); echo Config::Get('MONEY_UNIT'); ?> per Month</td>
<?php
}
else
{
?><td align=center><?php echo number_format($aircraft->price,2,",","."); echo Config::Get('MONEY_UNIT'); ?></td>
<?php
}
?>	
    <td align="center" width="1%" nowrap>
<?php if($aircraft->bought ==0)
{

	// Show these if it is not bought

?>
<button class="{button:{icons:{primary:'ui-icon-wrench'}}}" 
      onclick="window.location='<?php echo adminurl('/operations/buysellaircraft?id='.$aircraft->id);?>';">Buy</button>

<?php
}
else

{
// Show these if it is bought and not under Repair
?>
<?php
if ($aircraft->rep ==0)
{
?>
<button class="{button:{icons:{primary:'ui-icon-wrench'}}}" 
      onclick="window.location='<?php echo adminurl('/operations/buysellaircraft?id='.$aircraft->id);?>';">Options</button>
<?php
}
else
{ echo "Under Repair"; }
?>


<?php
}
?></td>
    <td align="center" width="1%" nowrap>
		<button class="{button:{icons:{primary:'ui-icon-wrench'}}}" 
			onclick="window.location='<?php echo adminurl('/operations/editaircraft?id='.$aircraft->id);?>';">Edit</button>
	</td>
</tr>
<?php
}
?>
</tbody>
</table>