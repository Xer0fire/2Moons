var acstime = 0;
	
function updateVars()
{
	document.getElementsByName("fleet_group")[0].value = 0;
	dataFlyDistance = GetDistance();
	dataFlyTime = GetDuration();
	dataFlyConsumption = GetConsumption();
	dataFlyCargoSpace = storage();
	refreshFormData();
}

function GetDistance() {
	var thisGalaxy = data.planet.galaxy;
	var thisSystem = data.planet.system;
	var thisPlanet = data.planet.planet;
	var targetGalaxy = document.getElementsByName("galaxy")[0].value;
	var targetSystem = document.getElementsByName("system")[0].value;
	var targetPlanet = document.getElementsByName("planet")[0].value;

	if (targetGalaxy - thisGalaxy != 0) {
		return Math.abs(targetGalaxy - thisGalaxy) * 20000;
	} else if (targetSystem - thisSystem != 0) {
		return Math.abs(targetSystem - thisSystem) * 5 * 19 + 2700;
	} else if (targetPlanet - thisPlanet != 0) {
		return Math.abs(targetPlanet - thisPlanet) * 5 + 1000;
	} else {
		return 5;
	}
}

function GetDuration() {
	var sp = document.getElementsByName("speed")[0].value;
	return Math.max(Math.round((3500 / (sp * 0.1) * Math.pow(dataFlyDistance * 10 / data.maxspeed, 0.5) + 10) / data.gamespeed) * data.fleetspeedfactor, data.fleetMinDuration);
}

function GetConsumption() {
	var dataFlyConsumption = 0;
	var dataFlyConsumption2 = 0;
	var basicConsumption = 0;
	var i;
	$.each(data.ships, function(shipid, ship){
		spd = 35000 / (dataFlyTime * data.gamespeed - 10) * Math.sqrt(dataFlyDistance * 10 / ship.speed);
		basicConsumption = ship.consumption * ship.amount;
		dataFlyConsumption2 += basicConsumption * dataFlyDistance / 35000 * (spd / 10 + 1) * (spd / 10 + 1);
	});
	return Math.round(dataFlyConsumption + dataFlyConsumption2) + 1;
}

function storage() {
	return data.fleetroom - dataFlyConsumption;
}

function refreshFormData() {
	var seconds = dataFlyTime;
	var hours = Math.floor(seconds / 3600);
	seconds -= hours * 3600;
	var minutes = Math.floor(seconds / 60);
	seconds -= minutes * 60;
	$("#duration").text(hours + (":" + dezInt(minutes, 2) + ":" + dezInt(seconds,2) + " h"));
	$("#distance").text(NumberGetHumanReadable(dataFlyDistance));
	$("#maxspeed").text(NumberGetHumanReadable(data.maxspeed));
	if (dataFlyCargoSpace >= 0) {
		$("#consumption").html("<font color=\"lime\">" + NumberGetHumanReadable(dataFlyConsumption) + "</font>");
		$("#storage").html("<font color=\"lime\">" + NumberGetHumanReadable(dataFlyCargoSpace) + "</font>");
	} else {
		$("#consumption").html("<font color=\"red\">" + NumberGetHumanReadable(dataFlyConsumption) + "</font>");
		$("#storage").html("<font color=\"red\">" + NumberGetHumanReadable(dataFlyCargoSpace) + "</font>");
	}
}

function setACSTarget(galaxy, solarsystem, planet, type, tacs) {
	setTarget(galaxy, solarsystem, planet, type);
	updateVars();
	document.getElementsByName("fleet_group")[0].value = tacs;
}

function setTarget(galaxy, solarsystem, planet, type) {
	document.getElementsByName("galaxy")[0].value = galaxy;
	document.getElementsByName("system")[0].value = solarsystem;
	document.getElementsByName("planet")[0].value = planet;
	document.getElementsByName("type")[0].value = type;
}

function FleetTime(){ 
	var sekunden = serverTime.getSeconds();
	var starttime = dataFlyTime;
	var endtime	= starttime + dataFlyTime;
	$("#arrival").html(getFormatedDate(serverTime.getTime()+1000*starttime, tdformat));
	$("#return").html(getFormatedDate(serverTime.getTime()+1000*endtime, tdformat));
}

function setResource(id, val) {
	if (document.getElementsByName(id)[0]) {
		document.getElementsByName("resource" + id)[0].value = val;
	}
}

function maxResource(id) {
	var thisresource = getRessource(id);
	var thisresourcechosen = parseInt(document.getElementsByName(id)[0].value);
	if (isNaN(thisresourcechosen)) {
		thisresourcechosen = 0;
	}
	if (isNaN(thisresource)) {
		thisresource = 0;
	}
	
	var storCap = data.fleetroom - data.consumption;

	if (id == 'deuterium') {
		thisresource -= data.consumption;
	}
	var metalToTransport = parseInt(document.getElementsByName("metal")[0].value);
	var crystalToTransport = parseInt(document.getElementsByName("crystal")[0].value);
	var deuteriumToTransport = parseInt(document.getElementsByName("deuterium")[0].value);
	if (isNaN(metalToTransport)) {
		metalToTransport = 0;
	}
	if (isNaN(crystalToTransport)) {
		crystalToTransport = 0;
	}
	if (isNaN(deuteriumToTransport)) {
		deuteriumToTransport = 0;
	}
	var freeCapacity = Math.max(storCap - metalToTransport - crystalToTransport - deuteriumToTransport, 0);
	document.getElementsByName(id)[0].value = Math.min(freeCapacity + thisresourcechosen, thisresource);
	calculateTransportCapacity();
}


function maxResources() {
	maxResource('metal');
	maxResource('crystal');
	maxResource('deuterium');
}

function calculateTransportCapacity() {
	var metal = Math.abs(document.getElementsByName("metal")[0].value);
	var crystal = Math.abs(document.getElementsByName("crystal")[0].value);
	var deuterium = Math.abs(document.getElementsByName("deuterium")[0].value);
	transportCapacity = data.fleetroom - data.consumption - metal - crystal - deuterium;
	if (transportCapacity < 0) {
		document.getElementById("remainingresources").innerHTML = "<font color=red>" + NumberGetHumanReadable(transportCapacity) + "</font>";
	} else {
		document.getElementById("remainingresources").innerHTML = "<font color=lime>" + NumberGetHumanReadable(transportCapacity) + "</font>";
	}
	return transportCapacity;
}

function maxShip(id) {
	if (document.getElementsByName(id)[0]) {
		var amount = document.getElementById(id + "_value").innerHTML;
		document.getElementsByName(id)[0].value = amount.replace(/\./g, "");
	}
}

function maxShips() {
	var id;
	$('input[name^="ship"]').each(function() {
		maxShip($(this).attr('name'));
	})
}


function noShip(id) {
	if (document.getElementsByName(id)[0]) {
		document.getElementsByName(id)[0].value = 0;
	}
}


function noShips() {
	var id;
	$('input[name^="ship"]').each(function() {
		noShip($(this).attr('name'));
	});
}

function setNumber(name, number) {
	if (typeof document.getElementsByName("ship" + name)[0] != "undefined") {
		document.getElementsByName("ship" + name)[0].value = number;
	}
}

function CheckTarget()
{
	kolo	= (typeof data.ships[208] == "object") ? 1 : 0;
		
	$.getJSON('game.php?page=fleetStep1&mode=checkTarget&galaxy='+document.getElementsByName("galaxy")[0].value+'&system='+document.getElementsByName("system")[0].value+'&planet='+document.getElementsByName("planet")[0].value+'&planet_type='+document.getElementsByName("type")[0].value+'&lang='+Lang+'&kolo='+kolo, function(data) {
		if(data == "OK") {
			document.getElementById('form').submit();
		} else {
			toastr["error"](data,op_error);
		}
	});
	return false;
}

function EditShortcuts() {
	$(".shortcut-edit, .shortcut-link-save").removeClass("d-none");
	$(".shortcut-view, .shortcut-link-edit").addClass("d-none");
}

function AddShortcuts() {
	var max = $('#shortcut-max').data()['shortcut'] += 1;
	$('#shortcut-max').attr('data-shortcut', max);
	$("#shortcut-edit-new").clone().prop("id", "shortcut-edit-"+max).appendTo('.shortcut-edit').removeClass('d-none');
	$("#shortcut-edit-"+max+" #shortcut-type").attr("data-scid", max);
	$("#shortcut-edit-"+max+" .shortcut-delete").attr("data-shortcut-no", max);
}

function SaveShortcuts() {
	var list = $('.shortcut-edit').find("input, select");
	var scArr = [];
	var v2p = [];

	list.each(function(i) {
		switch(list[i].id) {
			case "shortcut-name":
				v2p.push(list[i].value);
			break;
			case "shortcut-galaxy":
				v2p.push(list[i].value);
			break;
			case "shortcut-system":
				v2p.push(list[i].value);
			break;
			case "shortcut-planet":
				v2p.push(list[i].value);
			break;
			case "shortcut-type":
				v2p.push(list[i].value);
				v2p.push(list[i].dataset.scid);
				scArr.push(v2p);
				v2p = [];
			break;
			default:
		}
	});

	if (scArr.length == 0) {
		$(".shortcut-edit, .shortcut-link-save").addClass("d-none");
		$(".shortcut-view, .shortcut-link-edit").removeClass("d-none");
		return;
	}

	for (var i = 0; i < scArr.length; i++) {
		if (scArr[i][0] == "" || scArr[i][1] == "" || scArr[i][2] == "" || scArr[i][3] == "") {
			toastr["error"](fl_shortcut_error,op_error);
			return;
		}
	}

	$.getJSON('game.php?page=fleetStep1&mode=saveShortcuts&ajax=1&shortcut='+encodeURIComponent(JSON.stringify(scArr, true)), function(res) {
		$(".shortcut-view").remove();
		$(".shortcut-edit, .shortcut-link-save").addClass("d-none");
		$(".shortcut-link-edit").removeClass("d-none");

		if (!Array.isArray(scArr) || !scArr.length) {
			$('#shortcut-max').data('shortcut', 0);
			$("#fleet-shortcut-body").append(
				'<div class="row"><div class="col-12 text-center shortcut-view">'+fl_no_shortcuts+'</div></div>'
			);
		} else {
			var append;
			append = '<div class="row justify-content-md-around shortcut-view">';
			res = JSON.parse(res);
			$.each(res, function(i, v) {
				if (v.name == "" || v.galaxy == "" || v.system == "" || v.planet == "") {
					
				} else {
					var pt;
					switch(v.type) {
						case "1":
							pt = 'P';
						break;
						case "2":
							pt = 'DF';
						break;
						case "3":
							pt = 'M';
						break;
					}
					append = append+'<div class="col-auto"><a href="javascript:setTarget('+v.galaxy+','+v.system+','+v.planet+','+v.type+');updateVars();">'+v.name+' ('+pt+') ['+v.galaxy+':'+v.system+':'+v.planet+']</a></div>';
				}
				if (typeof v.oldid != "undefined") {
					$("#shortcut-edit-"+v.oldid+" .shortcut-delete").attr("data-shortcut-no", i);
					$("#shortcut-edit-"+v.oldid+" #shortcut-type").attr("data-scid", i);
					$("#shortcut-edit-"+v.oldid).prop("id", "shortcut-edit-"+i)
				}
			});
			$('#shortcut-max').attr('data-shortcut',scArr.length);
			$("#fleet-shortcut-body").append(append+'</div>');
		}
		toastr["info"](fl_shortcut_saved,lm_info);
	});
}

$(function() {
	$(".shortcut-edit").on('click', '.shortcut-delete', function () {
		var scno = $(this).data("shortcut-no");
		$.getJSON('game.php?page=fleetStep1&mode=deleteShortcut&ajax=1&scid='+scno, function(res) {
			toastr["info"](res,lm_info);
		});
		$("#shortcut-edit-"+scno).remove();
		var scTotal = $('#shortcut-max').data()['shortcut'] -= 1;
		$('#shortcut-max').attr('data-shortcut', scTotal);
		if (scTotal == 0) {
			$(".shortcut-edit, .shortcut-link-save").addClass("d-none");
			$(".shortcut-link-edit").removeClass("d-none");
			$(".shortcut-view").remove();
			$("#fleet-shortcut-body").append(
				'<div class="row"><div class="col-12 text-center shortcut-view">'+fl_no_shortcuts+'</div></div>'
			);
		}
	});
});