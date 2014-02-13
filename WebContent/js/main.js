function renderUsers(data){
	$("#users tr").remove();
	var $el = $(document.createDocumentFragment());
	for(var i=0; i<data.length; i++){
		var item = ""+
			"<tr>"+
				"<td>"+data[i].id+"</td>"+
				"<td>"+data[i].name+"</td>"+
				"<td class='operationGroup'>"+
					"<button type='button' class='btn btn-xs btn-success edit' data-toggle='modal' data-target='#editUser'>Edit</button>"+
					"<button type='button' class='btn btn-xs btn-danger delete'>Delete</button>"+
				"</td>"+
			"</tr>";
		var $item = $(item);
		$item.find(".operationGroup .edit").data("data", data[i]);
		$item.find(".operationGroup .delete").data("data", data[i]);

		$item.find(".operationGroup .edit").click(function(){
			var id = $(this).data("data").id;
			var name = $(this).data("data").name;
			var password = $(this).data("data").password;
			$("#edit_id").val(id);
			$("#edit_name").val(name);
			$("#edit_password").val(password);
		});

		$item.find(".operationGroup .delete").click(function(){
			var id = $(this).data("data").id;
			deleteUser( id );
		});
		$el.append($item);
	}
	$("#users").append($el);
};

function getUsers(){
	var url = "TestServlet";
	$.ajax({
        type: "GET",
        url: url,
        //contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            renderUsers(data);

        },
        error: function (msg) {
        }
    });
};

function addUser( name, password ){
	var url = "TestServlet";
	var options = {
		action: "add",
		name: name,
		password: password,
	};
	$.ajax({
        type: "POST",
        url: url,
        //contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: obj2PostData(options),
        success: function (data) {
            console.log(data);
            $('#addUser').modal('toggle');
            getUsers();
        },
        error: function (msg) {
            console.log(msg);
        }
    });
};

function editUser( id, name, password ){
	var url = "TestServlet";
	var options = {
		action: "update",
		id: id,
		name: name,
		password: password
	};
	$.ajax({
        type: "POST",
        url: url,
        //contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: obj2PostData(options),
        success: function (data) {
            console.log(data);
            if(data.result === "ok"){
            	$('#editUser').modal('toggle');
            	getUsers();
            }
        },
        error: function (msg) {
            console.log(msg);
        }
    });
};

function deleteUser( id ){
	var url = "TestServlet";
	var options = {
		action: "delete",
		id: id
	};
	$.ajax({
        type: "POST",
        url: url,
        //contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: obj2PostData(options),
        success: function (data) {
            console.log(data);
            if(data.result === "ok"){
            	getUsers();
            }
        },
        error: function (msg) {
            console.log(msg);
        }
    });
};

function deleteAllUsers(){
	var url = "TestServlet";
	var options = {
		action: "deleteAll"
	};
	$.ajax({
        type: "POST",
        url: url,
        //contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: obj2PostData(options),
        success: function (data) {
            console.log(data);
            if(data.result === "ok"){
            	getUsers();
            }
        },
        error: function (msg) {
            console.log(msg);
        }
    });
};

$(document).ready(function(){
	// init events for DOM
	$("#add_user_save").click(function(){
		var name = $("#add_name").val();
		var password = $("#add_password").val();
		if($.trim(name) !== ""){
			addUser(name, password);
		}
	});

	$("#edit_user_save").click(function(){
		var id = $("#edit_id").val();
		var name = $("#edit_name").val();
		var password = $("#edit_password").val();
		if($.trim(name) !== ""){
			editUser(id, name, password);
		}
	});

	$("#deleteAll").click(function(){
		deleteAllUsers();
	});

	getUsers();
	
});

function obj2PostData( o ){
	var rc = "";
	for(var item in o){
		if(rc !== ""){
			rc += "&";
		}
		rc += item+"="+o[item];
			
	}
	return rc;
}