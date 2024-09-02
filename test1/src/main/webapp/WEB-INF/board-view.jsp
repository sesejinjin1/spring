<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	
</head>
<style>
	table, tr, th ,td { border: 1px solid #aaa;}
</style>
<body>
	<div id="app">
		<div>글번호 : {{info.boardNo}}</div>
		<div>제목 : {{info.title}}</div>
		<div>내용 : <span v-html="info.contents"></div>
		<div> 작성자 : {{info.userId}} </div>
		<div v-if="info.userId == sessionId || sessionStatus =='A'"><button @click="fnRemove(info.boardNo)">삭제버튼</button></div>
		<div>
			{{commentList[0]}} </br>
			{{commentList[1]}}
		</div>
	</div>
	
	
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				boardNo : '${boardNo}',
				info : {},
				sessionId : '${sessionId}',
				sessionStatus : '${sessionStatus}',
				commentList : []
				
            };
        },
        methods: {
			fnGetList(){
					var self = this;
					var nparmap = {boardNo : self.boardNo};
					$.ajax({
						url:"board-view.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
							self.info=data.info;
							self.commentList=data.commentList;
						}
					});
			    },
		  fnRemove(boardNo){
				  	var self = this;
				  	var nparmap = {boardNo : boardNo};
				  	if(!confirm("삭제 하시겠습니까?")){
				  		return;
				  	}
				  	$.ajax({
				  		url:"board-remove.dox",
				  		dataType:"json",	
				  		type : "POST", 
				  		data : nparmap,
				  		success : function(data) { 
				  			alert(data.message);
				  			location.href="board-list.do";
				  		}
				  	});
			  },
/*		fnGetComment(boardNo){
					var self = this;
					var nparmap= {boardNo : boardNo};
					$.ajax({
					url:"board-view.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
					}
				});
			
		}*/
	  },
        mounted() {
			var self = this;
           	self.fnGetList();
        }
    });

    app.mount('#app');
</script>