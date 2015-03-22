app.article = {
  init : function() {
	this.initStatus();
	this.bindingEvents();	
  },
  initStatus : function () {
	debugger
  },
  bindingEvents : function () {
	$("body").on("click", "a.s-delete", this.deleteComment);
  },
  deleteComment : function () {
	debugger
	var _this = $(this);
	var isDelete = confirm("确认删除?");
	if (isDelete){
	  $.ajax({
	    type : "delete",
	    url : _this.attr("href") ,
	    data : {
		  "id" : $(".s-comment").data("id"),
		  "authenticity_token" : $("meta[name='csrf-token']").attr("content")
	    },
	    success : function (result) {
			debugger
		  if (result.success){
		    _this.parent().parent().hide();
		  }
	    },
	    error : function () {
			debugger
		  alert("sorry,it's error.");
	    }
	  });
	  return false;
	}
	else {
	  return false;
	}
  }
}
