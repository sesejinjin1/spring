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

		.pagination {justify-content: center;align-items: center;margin: 20px 0;}

		.pagination button {background-color: #f8f9fa;border: 1px solid #dee2e6;color: #007bff;padding: 8px 12px;margin: 0 2px;cursor: pointer;transition: background-color 0.3s, color 0.3s;border-radius: 4px;}
		.pagination button:hover {background-color: #007bff;color: white;}
		.pagination button.active {background-color: #007bff;color: white;cursor: default;}
		.pagination button:disabled {background-color: #e9ecef;color: #6c757d;cursor: not-allowed;border: 1px solid #dee2e6;}
		.pagination button:not(.active):not(:disabled):hover {background-color: #0056b3;color: white;}
	
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
			</select>
			<div>검색 : <input type="text" placeholder="검색어" v-model="keyword"> <button @click="fnGetList(1)">검색</button></div>
		</div>
		<div style="margin : 20px;">
		<select v-model ="size" @change="fnGetList(1)">
			<option value="5">5개씩</option>
			<option value="10">10개씩</option>
			<option value="15">15개씩</option>
		</select>
		</div>
		<table >
			<tr>
				<th>체크</th>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>삭제</th>
			</tr>
			<tr v-for="item in list">
				<td><input type="checkbox" v-model="selectItem" :value="item.boardNo"></td>
				<td>{{item.boardNo}}</td>
				<td><a href="#" @click="fnView(item.boardNo)">{{item.title}} [{{item.cnt}}]</a></td>
				<td><a href="#" @click="fnUserInfo(item.userId)">{{item.userName}}</a></td>
				<td>{{item.hit}}</td>
				<td>{{item.cdateTime2}}</td>
				<td><button @click="fnRemove(item.boardNo)">삭제</button></td>
			</tr>
		</table>
		<button type="button" @click="fnCheckRemove">선택 삭제</button>
		<div><button @click="fnInsert">글쓰기</button></div>
		
		<div class="pagination">
		    <button v-if="currentPage > 1"  @click="fnGetList(currentPage-1)"  >이전</button>
		    <button v-for="page in totalPages" :class="{active: page == currentPage}"  @click="fnGetList(page)" >
		        {{ page }}
		    </button>
		    <button v-if="currentPage < totalPages" @click="fnGetList(currentPage+1)" >다음</button>
		</div>
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
				cateNum : "",
				sessionId : '${sessionId}',
				currentPage: 1,      
				pageSize: 5,        
				totalPages: "",
				boardCnt : [],
				size : 5,
				selectItem : []
				
            };
        },
        methods: {
            fnGetList(page){
				var self = this;
				self.pageSize = self.size;
				var startIndex = (page-1) * self.pageSize;
				var outputNumber = self.pageSize;
				self.currentPage = page;
				var nparmap = {keyword : self.keyword, searchOption : self.searchOption, cateNum : self.cateNum, startIndex : startIndex, outputNumber : outputNumber};
				$.ajax({
					url:"board-list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						console.log(data.list);
						self.list=data.list;
						self.totalPages  = Math.ceil(data.cnt /self.pageSize);
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
			},
			fnInsert(){
				location.href="board-insert.do";
			},
			fnCheckRemove(){
				var self = this;
				var fList = JSON.stringify(self.selectItem);
				var nparmap = {selectItem : fList};
				$.ajax({
					url:"check-remove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						self.fnGetList(1); 
					}
				});
			}
        },
        mounted() {
            var self = this;
			self.fnGetList(1);	
			
        }
    });

    app.mount('#app');
</script>