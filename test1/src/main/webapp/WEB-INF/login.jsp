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
		<div> 아이디 : <input type="text" placeholder="아이디" v-model="userId">
		</div>
		<div> 패스워드 : <input type="password" placeholder="패스워드" v-model="userPwd">
		</div>
		<button @click="fnSave">저장</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {

            };
        },
        methods: {
			

        },
        mounted() {

        }
    });

    app.mount('#app');
</script>