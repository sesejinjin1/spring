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
		
		<div>이름 : <input type="text" v-model="name" ></div>
		<div>학년 : <input type="text" v-model="grade" ></div>
		<button @click="fnSave"> 저장 </button>
	</div>
	
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				info : {},
				stuNo : '${stuNo}',
				name : "" ,
				grade : ""
            };
        },
        methods: {
			fnGetList(){
					var self = this;
					var nparmap = {stuNo : self.stuNo};
					$.ajax({
						url:"school-stuView.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
							self.info = data.info;
						}
					});
			    },
				fnSave(){
					var self = this;
					var nparam = {stuNo : self.stuNo , name : self.name , grade : self.grade}
					$.ajax({
									url:"stuUpdate.dox",
									dataType:"json",	
									type : "POST", 
									data : nparam,
									success : function(data) { 
										console.log(data);
										location.href="school-stu.do"
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