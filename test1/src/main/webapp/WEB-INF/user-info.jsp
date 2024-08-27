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
		<div>아이디 : {{info.userId}}</div>
		<div>이름 : {{info.userName}}</div>
	</div>
	
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				userId : '${userId}',
				info : {}
				
            };
        },
        methods: {
			fnGetList(){
						var self = this;
						var nparmap = {userId : self.userId};
						$.ajax({
							url:"user-info.dox",
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