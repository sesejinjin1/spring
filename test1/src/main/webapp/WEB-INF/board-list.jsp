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
	table, tr, th ,td { border: 1px solid #aaa;margin : 20px;}
</style>
<body>
	<div id="app">
		<ul style="margin : 20px;">
			<li><a href="#" @click="fnCategoryList('')">:: 전체 ::</a></li>
			<li><a href="#" @click="fnCategoryList('1')">1 : 공지사항</a></li>
			<li><a href="#" @click="fnCategoryList('2')">2 : 자유게시판</a></li>
			<li><a href="#" @click="fnCategoryList('3')">3 : 질문게시판</a></li>
		</ul>
		<div  style="margin : 20px;">
			<select v-model="searchOption">
				<option value="">:: 전체 ::</option>
				<option value="title">제목</option>
				<option value="userName">작성자</option>
			<select>
			<div>검색 : <input type="text" placeholder="검색어" v-model="keyword"> <button @click="fnGetList">검색</button></div>
		</div>
		<table >
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
				keyword : "",
				searchOption : "",
				cateNum : ""
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {keyword : self.keyword, searchOption : self.searchOption, cateNum : self.cateNum};
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
				if(!confirm("삭제 하시겠습니까?")){
					return;
				}
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
						},
			fnCategoryList(cateNum){
				var self = this;
				self.cateNum = cateNum;
				self.fnGetList();
			}
        },
        mounted() {
            var self = this;
			self.fnGetList();
        }
    });

    app.mount('#app');
</script>