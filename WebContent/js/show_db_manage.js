window.config = window.config || {};
config.table_name = "testTable";
config.primary_key = "id";
config.fields = ["name", "password"];

function func_render(data){
	$("#"+config.table_name+"s tr").remove();
	var $el = $(document.createDocumentFragment());
	for(var i=0; i<data.length; i++){
		var item = ""+
			"<tr>";
			item+="<td>"+data[i][config.primary_key]+"</td>";
			for (var j = 0; j < config.fields.length; j++) {
				item+="<td>"+data[i][config.fields[j]]+"</td>";
			};
			item+=""+
				"<td class='operationGroup'>"+
					"<button type='button' class='btn btn-xs btn-success edit' data-toggle='modal' data-target='#edit_"+config.table_name+"'>Edit</button>"+
					"<button type='button' class='btn btn-xs btn-danger delete'>Delete</button>"+
				"</td>"+
			"</tr>";
		var $item = $(item);
		$item.find(".operationGroup .edit").data("data", data[i]);
		$item.find(".operationGroup .delete").data("data", data[i]);

		$item.find(".operationGroup .edit").click(function(){
			$("#edit_"+config.primary_key).val($(this).data("data")[config.primary_key]);
			for (var j = 0; j < config.fields.length; j++) {
				$("#edit_"+config.fields[j]).val($(this).data("data")[config.fields[j]]);
			};
		});

		$item.find(".operationGroup .delete").click(function(){
			var _this = this;
			alertify.confirm("您真的要删除"+$(_this).data("data").name+"么？",function(e){
				if(!e){
					return;
				}else{
					var id = $(_this).data("data").id;
					func_delete( id );
				}
			});
		});
		$el.append($item);
	}
	$("#"+config.table_name+"s").append($el);
};

function func_get(){
	var url = "sub/"+config.table_name;
	$.ajax({
        type: "GET",
        url: url,
        //contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            func_render(data);
        },
        error: function (msg) {
        }
    });
};

function func_add( options ){
	var url = "sub/"+config.table_name;
	options.action = "add";
	$.ajax({
        type: "POST",
        url: url,
        //contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: util.obj2PostData(options),
        success: function (data) {
            clearAddModal();
            $('#add_'+config.table_name).modal('toggle');
            func_get();
        },
        error: function (msg) {
        }
    });
};

function func_edit( options ){
	var url = "sub/"+config.table_name;
	options.action = "update";
	$.ajax({
        type: "POST",
        url: url,
        //contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: util.obj2PostData(options),
        success: function (data) {
            if(data.result === "ok"){
            	$('#edit_'+config.table_name).modal('toggle');
            	clearEditModal()
            	func_get();
            }
        },
        error: function (msg) {
        }
    });
};

function func_delete( key ){
	var url = "sub/"+config.table_name;
	var options = {
		action: "delete"
	};
	options[config.primary_key] = key;
	$.ajax({
        type: "POST",
        url: url,
        //contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: util.obj2PostData(options),
        success: function (data) {
            if(data.result === "ok"){
            	func_get();
            }
        },
        error: function (msg) {
        }
    });
};

function func_deleteAll(){
	var url = "sub/"+config.table_name;
	var options = {
		action: "deleteAll"
	};
	$.ajax({
        type: "POST",
        url: url,
        //contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: util.obj2PostData(options),
        success: function (data) {
            if(data.result === "ok"){
            	func_get();
            }
        },
        error: function (msg) {
        }
    });
};

$(document).ready(function(){
	util.showNav("manage-"+config.table_name);
	// init events for DOM
	$("#add_"+config.table_name+"_save").click(function(){
		var options = {};
		for (var i = 0; i < config.fields.length; i++) {
			options[config.fields[i]] = encodeURI($("#add_"+config.fields[i]).val());
		};
		func_add(options);
	});

	$("#edit_"+config.table_name+"_save").click(function(){
		var options = {};
		options[config.primary_key] = $("#edit_"+config.primary_key).val();
		for (var i = 0; i < config.fields.length; i++) {
			options[config.fields[i]] = $("#edit_"+config.fields[i]).val();
		};
		func_edit(options);
	});

	$("#deleteAll").click(function(){
		alertify.confirm("警告: 您真的要删除所有数据么？",function(e){
			if(!e){
				return;
				func_deleteAll();
			}
		});
	});

	func_get();

});

// page helper
function clearAllModal(){
	clearAddModal();
	clearEditModal()
}
function clearAddModal(){
	$("#add_name").val("");
	$("#add_password").val("");
}
function clearEditModal(){
	$("#edit_id").val("");
	$("#edit_name").val("");
	$("#edit_password").val("");
}
