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
	table{
		margin : 10px;
	}
	table, tr, th, td{
		padding : 10px;
		border : 1px solid black;
		border-collapse : collapse;
		text-align : center;
	}
</style>
<body>
	<div id="app">
		<div style="margin : 10px;">
			<input type="checkbox" value="10"  v-model="selectItem" @click="fnGetCheckList">ACCOUNTING
			<input type="checkbox" value="20"  v-model="selectItem" @click="fnGetCheckList">RESEARCH
			<input type="checkbox" value="30"  v-model="selectItem" @click="fnGetCheckList">SALES
			<input type="checkbox" value="40"  v-model="selectItem" @click="fnGetCheckList">OPEARTIONS
		</div>
		<table>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>직급</th>
				<th>부서명</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.empno}}</td>
				<td>{{item.ename}}</td>
				<td>{{item.job}}</td>
				<td>{{item.deptno}}</td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                name : "홍길동",
				list : [],
				selectItem : []
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var fList = JSON.stringify(self.selectItem);
				var nparmap = {selectItem : fList};
				$.ajax({
					url:"emp.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
					}
				});
            },
			fnGetCheckList(){
				var self = this;
				var fList = JSON.stringify(self.selectItem);
				var nparmap = {selectItem : fList};
				$.ajax({
					url:"empcheck.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
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