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
			<template v-for="item in codeList">
			<input type="checkbox" :value="item.code"  v-model="selectItem" @change="fnGetList">{{item.codeName}}
			</template>
		</div>
		<table>
			<tr>
				<th>제품번호</th>
				<th>제품명</th>
				<th>가격</th>
				<th>종류</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.itemNo}}</td>
				<td>{{item.itemName}}</td>
				<td>{{item.price}}</td>
				<td>{{item.codeName}}</td>
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
				selectItem : [],
				codeList : []
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var fList = JSON.stringify(self.selectItem);
				var nparmap = {selectItem : fList};
				$.ajax({
					url:"item.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						self.list = data.list;
						self.codeList = data.codeList;
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