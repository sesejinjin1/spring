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
		
		<div>학번 : {{info.stuNo}}</div>
		<div>이름 : {{info.name}}</div>
		<div>학부 : {{info.dname1}} </div>
		<div>학과: {{info.dname2}} </div>
		<div>담당 교수 : {{info.pname}} </div>
	</div>
	
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				info : {},
				stuNo : '${stuNo}'
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
	  },
        mounted() {
			var self = this;
           	self.fnGetList();
        }
    });

    app.mount('#app');
</script>