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
		<div>
			아이디 : <input type="text" placeholder="아이디" v-model="userId" >
			<button @click="fnIdCheck">중복체크</button>
		</div>
		<div>패스워드 : <input type="password" placeholder="패스워드" v-model="pwd"></div>
		<div>이름 : <input type="text" placeholder="이름" v-model="userName"></div>
		<div>이메일 : <input type="text" placeholder="이메일주소" v-model="email"></div>
		<div>휴대폰번호 : <input type="text" placeholder="휴대폰번호" v-model="phone"></div>
		<div>성별 : <label><input type="radio" value="M" name="gender" v-model="gender">남자</label>
			 	  <label><input type="radio" value="F" name="gender" v-model="gender">여자</label> </div>
		<div><button @click="fnJoin">회원가입</button></div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				userId : "",
				pwd : "",
				userName : "",
				email : "",
				phone : "",
				gender : "",
				check : false
            };
        },
        methods: {
			fnIdCheck(){
					var self = this;
					var nparmap = {userId : self.userId};

					$.ajax({
						url:"user-info.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							if(data.info == undefined){
								alert("사용 가능한 아이디!");
								self.check = true;
							}else{
								alert("이미 사용중인 아이디!");
							}
						}
					});
				},
				fnJoin(){
					var self = this;
					var nparmap = {userId : self.userId, pwd : self.pwd, userName : self.userName,
						 email : self.email, phone : self.phone, gender : self.gender};
						 if(self.check==false){
							alert("아이디 "+ self.userId.length + "중복체크를 해주세요");
							return;
						 }
					$.ajax({
						url:"join.dox",
						dataType:"json",	
						type : "POST", 
						data : nparmap,
						success : function(data) { 
							console.log(data);
							alert("회원가입 성공 !");
						}
					});
				}
        },
        mounted() {

        }
    });

    app.mount('#app');
</script>