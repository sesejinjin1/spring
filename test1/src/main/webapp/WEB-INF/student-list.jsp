<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>첫번째 페이지</title>
	
</head>
<style>
</style>
<body>
	<div id="app">
		
		<input type="text" placeholder="학번" v-model="stuNo">
		<button @click="fnSearch()">검색</button>
		<div>
		<i class="fa-solid fa-image"></i>
		<i class="fa-solid fa-paperclip"></i>
		<i class="fa-solid fa-gear"></i>
		</div>
		<div>
			<span class="material-symbols-outlined">
			favorite
			</span>
			<span class="material-symbols-outlined">
			favorite
			</span>
		</div>
		{{info}}	
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                name : "홍길동",
				info : {},
				stuNo : ""
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"ok.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						//self.list = data.list;
					}
				});
            },
			fnSearch(){
				var self = this;
				var nparmap = {stuNo : self.stuNo};

				$.ajax({
					url:"search.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						self.info=data.stu
						console.log(data);
							//self.list = data.list;
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