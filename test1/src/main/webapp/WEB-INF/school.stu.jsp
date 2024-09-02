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
	.pagination {justify-content: center;align-items: center;margin: 20px 0;}

	.pagination button {background-color: #f8f9fa;border: 1px solid #dee2e6;color: #007bff;padding: 8px 12px;margin: 0 2px;cursor: pointer;transition: background-color 0.3s, color 0.3s;border-radius: 4px;}
	.pagination button:hover {background-color: #007bff;color: white;}
	.pagination button.active {background-color: #007bff;color: white;cursor: default;}
	.pagination button:disabled {background-color: #e9ecef;color: #6c757d;cursor: not-allowed;border: 1px solid #dee2e6;}
	.pagination button:not(.active):not(:disabled):hover {background-color: #0056b3;color: white;}
		
</style>
<body>
	<div id="app">
		<select v-model="size" @change="fnGetList(1)">
			<option value="5">5</option>
			<option value="10">10</option>
			<option value="15">15</option>
		</select>
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
		<div class="pagination">
						    <button v-if="currentPage > 1" >이전</button>
						    <button v-for="page in totalPages" :class="{active: page == currentPage}"  @click="fnGetList(page)" >
						        {{ page }}
						    </button>
						    <button v-if="currentPage < totalPages" >다음</button>
				</div>
				
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				currentPage: 1,      
				pageSize: 10,        
				totalPages: 3,
				size : 5
            };
        },
        methods: {
			fnGetList(page){
				var self = this;
				self.pageSize = self.size;
				var startIndex = (page-1) * self.pageSize;
				var outputNumber = self.pageSize;
				self.currentPage = page
				var nparmap = {startIndex : startIndex , outputNumber : outputNumber};
				$.ajax({
					url:"school-stu.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						console.log(data.list);
						console.log(data.cnt);
						self.totalPages = Math.ceil(data.cnt/self.pageSize);
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
			self.fnGetList(1);
        }
    });

    app.mount('#app');
</script>