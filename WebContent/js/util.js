window.util = window.util || {};

window.util = {
	obj2PostData: function( o ){
		var rc = "";
		for(var item in o){
			if(rc !== ""){
				rc += "&";
			}
			rc += item+"="+o[item];
		}
		return rc;
	},
	showNav: function( name ){
		$("ul.nav li").removeClass("active");
		$("#nav-"+name).addClass("active");
	}
}