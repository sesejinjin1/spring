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
		<button @click="fnLogin">로그인!!</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				userId : "",
				userPwd : ""
				
            };
        },
        methods: {
			fnLogin(){
				var self = this;
				var nparmap = {userId : self.userId , userPwd : self.userPwd};

				$.ajax({
					url:"userLogin.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						//콘솔 찍을때 Impl 키값 확인하고 잘 찍기.
						console.log(data.info);
						console.log(data.message);
						if(data.info == undefined){
							alert("로그인 실패");
						}else{
							alert("로그인 성공");
							location.href="board-list.do";
						}

					}
				});
			}

        },
        mounted() {

        }
    });

    app.mount('#app');
</script>