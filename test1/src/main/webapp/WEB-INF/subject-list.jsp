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
</style>
<body>
	<div id="app">
		{{stuList}}	
		{{subList}}	
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                name : "홍길동",
				stuList : [],
				subList : []
				
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"sub-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						console.log(data.stuList);
						console.log(data.subList);
						self.stuList = data.stuList;
						self.subList = data.subList;
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