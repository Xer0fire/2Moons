<?php

/**
 *  2Moons 
 *   by Jan-Otto Kröpke 2009-2016
 *
 * For the full copyright and license information, please view the LICENSE
 *
 * @package 2Moons
 * @author Jan-Otto Kröpke <slaver7@gmail.com>
 * @copyright 2009 Lucky
 * @copyright 2016 Jan-Otto Kröpke <slaver7@gmail.com>
 * @licence MIT
 * @version 1.8.0
 * @link https://github.com/jkroepke/2Moons
 */

function calculateSteal($attackFleets, $defenderPlanet, $simulate = false)
{	
	// See: http://www.owiki.de/Beute
	global $pricelist, $resource;
	
	$firstResource	= 901;
	$secondResource	= 902;
	$thirdResource	= 903;
	
	$SortFleets 	= array();
	$capacity  	= 0;
	
	$stealResource	= array(
		$firstResource => 0,
		$secondResource => 0,
		$thirdResource => 0
	);
	
	foreach($attackFleets as $FleetID => $Attacker)
	{
		$SortFleets[$FleetID]		= 0;
		
		foreach($Attacker['unit'] as $Element => $amount)	
		{
		    if (($Element == 202 || $Element == 203 || $Element == 209) && $Attacker['player']['hyperspace_tech'] > 8 ) {
		        $SortFleets[$FleetID]		+= ($pricelist[$Element]['capacity'] * $amount) * (1 + (floor(($Attacker['player']['hyperspace_tech'] - 7) / 2) * 0.20));
		    } else {
		        $SortFleets[$FleetID]		+= $pricelist[$Element]['capacity'] * $amount;
		    }
		}
		
		$SortFleets[$FleetID]	-= $Attacker['fleetDetail']['fleet_resource_metal'];
		$SortFleets[$FleetID]	-= $Attacker['fleetDetail']['fleet_resource_crystal'];
		$SortFleets[$FleetID]	-= $Attacker['fleetDetail']['fleet_resource_deuterium'];
		$capacity				+= $SortFleets[$FleetID];
	}
	
	$AllCapacity		= $capacity;
	if($AllCapacity <= 0)
	{
		return $stealResource;
	}
	
	// Step 1
	$defFirstResource = max(($defenderPlanet[$resource[$firstResource]] - ResourceUpdate::getProtectedResources($defenderPlanet[$resource[22]], $defenderPlanet['metal_max'])), 0);
	$stealResource[$firstResource]		= min($capacity / 3, $defFirstResource / 2);
	$capacity	-= $stealResource[$firstResource];
	 
	// Step 2
	$defSecondResource = max(($defenderPlanet[$resource[$secondResource]] - ResourceUpdate::getProtectedResources($defenderPlanet[$resource[23]], $defenderPlanet['crystal_max'])), 0);
	$stealResource[$secondResource] 	= min($capacity / 2, $defSecondResource / 2);
	$capacity	-= $stealResource[$secondResource];
	 
	// Step 3
	$defThirdResource = max(($defenderPlanet[$resource[$defThirdResource]] - ResourceUpdate::getProtectedResources($defenderPlanet[$resource[24]], $defenderPlanet['deuterium_max'])), 0);
	$stealResource[$thirdResource] 		= min($capacity, $defThirdResource / 2);
	$capacity	-= $stealResource[$thirdResource];
		 
	// Step 4
	$oldMetalBooty  					= $stealResource[$firstResource];
	$stealResource[$firstResource] 		+= min($capacity / 2, $defFirstResource / 2 - $stealResource[$firstResource]);
	$capacity	-= $stealResource[$firstResource] - $oldMetalBooty;
		 
	// Step 5
	$stealResource[$secondResource] 	+= min($capacity, $defSecondResource / 2 - $stealResource[$secondResource]);
			
	if($simulate)
	{
		return $stealResource;
	}
	
	$db	= Database::get();

	foreach($SortFleets as $FleetID => $Capacity)
	{
		$slotFactor	= $Capacity / $AllCapacity;
		
		$sql	= "UPDATE %%FLEETS%% SET
		`fleet_resource_metal` = `fleet_resource_metal` + '".($stealResource[$firstResource] * $slotFactor)."',
		`fleet_resource_crystal` = `fleet_resource_crystal` + '".($stealResource[$secondResource] * $slotFactor)."',
		`fleet_resource_deuterium` = `fleet_resource_deuterium` + '".($stealResource[$thirdResource] * $slotFactor)."'
		WHERE fleet_id = :fleetId;";

		$db->update($sql, array(
			':fleetId'	=> $FleetID,
	  	));
	}
	
	return $stealResource;
}
	