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
	$("body").on("click", ".s-up-like", this.likeComment);
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
		  "id" : _this.parent().parent().parent().data("comment-id"),
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
  },
  likeComment : function() {
	debugger
	var _this = $(this);
	if($(".s-user-id").val() == "") {
	  alert("请先登录!");
	  return false;
	}
	$.ajax({
	  type: "GET",
	  url: "/user_comment_like_ships/up_like_count",
	  data: {
		"comment_id" : _this.parent().parent().parent().data("comment-id"),
		"user_id" : $(".s-user-id").val(),
		"authenticity_token" : $("meta[name='csrf-token']").attr("content")
	  },
	  success : function(result) {
		debugger
		if(result.is_up){
		  var num = _this.data("count") + 1;
		  _this.text("赞"+ num);
		}
		else{
		  alert("同一条评论不能重复赞");
		}
	  },
	  error : function() {
		alert("不好意思，出错了");
	  }
	});
	return false;
  }
}
