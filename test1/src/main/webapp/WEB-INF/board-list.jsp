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
		<div>검색 : <input type="text" placeholder="검색어" v-model="keyword"> <button @click="fnGetList">검색</button></div>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>삭제</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.boardNo}}</td>
				<td><a href="#" @click="fnView(item.boardNo)">{{item.title}}</a></td>
				<td><a href="#" @click="fnUserInfo(item.userId)">{{item.userName}}</a></td>
				<td>{{item.hit}}</td>
				<td>{{item.cdateTime}}</td>
				<td><button @click="fnRemove(item.boardNo)">삭제</button></td>
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
				keyword : ""
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {keyword : self.keyword};
				$.ajax({
					url:"board-list.dox",
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
			fnRemove(boardNo){
				var self = this;
				var nparmap = {boardNo : boardNo};
				$.ajax({
					url:"board-remove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert(data.message);
						self.fnGetList();
					}
				});
			},
			fnView(boardNo){
				$.pageChange("board-view.do",{boardNo : boardNo});
			},
			fnUserInfo(userId){
							$.pageChange("user-info.do",{userId : userId});
						}
        },
        mounted() {
			
            var self = this;
			self.fnGetList();
			
        }
    });

    app.mount('#app');
</script>