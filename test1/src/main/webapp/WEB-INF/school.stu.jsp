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
		스쿨페이지 
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>아이디</th>
				<th>학년</th>
				<th>주민번호</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.stuNo}}</td>
				<td><a href="#" @click="fnView(item.stuNo)">{{item.name}}</a></td>
				<td><a href="#" @click="fnStuUpdate(item.stuNo)">{{item.id}}</td>
				<td>{{item.grade}}</td>
				<td>{{item.jumin}}</td>
			</tr>
			
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
            };
        },
        methods: {
			fnGetList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"school-stu.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						console.log(data.list);
						self.list=data.list;
					}
				});
			},
			fnView(stuNo){
					$.pageChange("school-stuView.do",{stuNo : stuNo});
			},
			fnStuUpdate(stuNo){
				$.pageChange("school-stuUpdate.do",{stuNo : stuNo});
			}
        },
        mounted() {
			var self = this;
			self.fnGetList();
        }
    });

    app.mount('#app');
</script>