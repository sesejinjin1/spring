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
		<div>제목 : {{info.title}}</div>
		<div>내용 : <div v-html="info.contents"></div>
	</div>
	
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				boardNo : '${boardNo}',
				info : {}
				
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
							}
						});
			          }
		
        },
        mounted() {
			var self = this;
           	self.fnGetList();
        }
    });

    app.mount('#app');
</script>