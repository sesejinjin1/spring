<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>user 리스트 출력</title>
</head>
<style>
	table, tr, th ,td { border: 1px solid #aaa; margin : 50px;}
</style>
<body>
	<div id="app">
		<button @click="fnBoardList">게시글목록(userController에서 작성)</button>
		<div>
			<input type="text" placeholder="검색" v-model="keyword">
			<button @click="fnUserList()">검색</button>
		</div>
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>삭제</th>
			</tr>
			<tr v-for="item in userList">
				<td>{{item.userId}}</td>
				<td><a href="#" @click="fnUserInfo(item.userId)">{{item.userName}}</a></td>
				<td>{{item.email}}</td>
				<td><button @click="fnRemove(item.userId)">삭제하기</button></td>
			</tr>
		</table>
		
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				userList : [],
				keyword : "",
				userId : ""
            };
        },
        methods: {
			fnUserList(){
				var self = this;
				var nparmap = { keyword : self.keyword};

				$.ajax({
					url:"user-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						console.log(data.list);
						self.userList = data.list;
					}
				});
			},
			fnBoardList(){
				var self = this;
				var nparmap = {};

				$.ajax({
					url:"user-board.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						console.log(data.userList);
						self.userList = data.userList;
					}
				});
			},
			fnRemove(userId){
				var self = this;
				var nparmap = {userId : userId};
				if(!confirm("삭제 ?")){
					return;
				}
				$.ajax({
					url:"user-delete.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(userId);
						self.fnUserList();
					}
				});
			},
			fnUserInfo(userId){
				console.log(userId);
				$.pageChange("user-info.do",{userId : userId});
			}
        },
        mounted() {
			var self = this;
           	self.fnUserList();
        }
    });
    app.mount('#app');
</script>