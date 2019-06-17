function checkrename()
{
	if($.trim($('#name').val()) == '') {
		return false;
	} else {
		var pname = $('#name').val();
		$.ajax({
			url: "game.php?page=overview&mode=rename&name="+pname,
			success: function(jdata){
				var data = JSON.parse(jdata);
				toastr["success"](data.message);
				parent.location.reload();
			}
		});
	}
}

function checkcancel()
{
	var password = $('#password').val();
	if(password == '') {
		return false;
	} else {
		$.ajax({
			url: "game.php?page=overview&mode=delete&password="+password,
			success: function(jdata){
				var data = JSON.parse(jdata);
				toastr["info"](data.message);
				if (data.ok) {
					parent.location.reload();
				}
			}
		});
	}
}